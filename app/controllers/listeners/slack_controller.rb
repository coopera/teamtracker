class Listeners::SlackController < ApplicationController
  def new

  end

  def create
    t = Thread.new do
      url = SlackRTM.get_url(token: params[:slack][:token])
      client = SlackRTM::Client.new(websocket_url: url)

      p "Thread started"

      client.on :message do |data|
        require 'date'
        p data

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
end
