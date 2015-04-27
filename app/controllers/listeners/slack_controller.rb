class Listeners::SlackController < ApplicationController
  def new

  end

  def create
    create_team_info(params[:slack][:token]) #if TeamInfo.first.nil?
    
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

    members_json = JSON.parse(http.request(request).body)['members']

    members = {}
    members_json.each do |member|
      members[member['id']] = member['name']
    end

    ###
    uri = URI.parse("https://slack.com/api/channels.list?token=#{token}&pretty=1")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true

    channels_json = JSON.parse(http.request(request).body)['channels']

    channels = {}
    channels_json.each do |channel|
      channels[channel['id']] = channel['name']
    end

    ###
    uri = URI.parse("https://slack.com/api/groups.list?token=#{token}&pretty=1")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true

    groups_json = JSON.parse(http.request(request).body)['groups']

    groups_json.each do |group|
      channels[group['id']] = group['name']
    end

    TeamInfo.destroy_all
    TeamInfo.create(slack_id_to_member_name: members, channel_id_to_name: channels)
  end
end
