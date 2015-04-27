class Listeners::SlackController < ApplicationController
  def new

  end

  def create
    create_team_info(params[:slack][:token]) if TeamInfo.first.nil?
    
    t = Thread.new do
      url = SlackRTM.get_url(token: params[:slack][:token])
      client = SlackRTM::Client.new(websocket_url: url)

      client.on :message do |data|
        require 'date'

        next if data['type'] != 'message'

        data = { 
          text: data['text'],
          channel_id: data['channel'],
          user_id: data['user'],
          timestamp: DateTime.strptime(data['ts'], '%s')
        }
        
        SlackNotification.create(data)
      end

      client.main_loop
    end

    t.abort_on_exception = true

    redirect_to root_path
  end

private

  def create_team_info(token)
    require 'net/http'

    uri = URI.parse("https://slack.com/api/users.list?token=#{token}&pretty=1")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true

    members = JSON.parse(http.request(request).body)['members']

    result = {}
    members.each do |member|
      result[member['id']] = member['name'] unless member['is_bot'] || member['deleted']
    end

    TeamInfo.create(slack_id_to_member_name: result)
  end
end
