require 'net/http'

class LoginController < ApplicationController
  def new
    if session[:user]
      @hooks = client = Octokit::Client.new(access_token: session[:user][:access_token]).org_hooks('4Soft')
      render text: session[:user].inspect
    else
      redirect_to "https://github.com/login/oauth/authorize?" + 
        "client_id=#{ENV['GH_CLIENT_ID']}" +
        "&scope=admin:org_hook"
    end
  end

  def create
    session[:user] = Octokit.exchange_code_for_token(params["code"],
      ENV['GH_CLIENT_ID'], ENV['GH_CLIENT_SECRET']).to_attrs

    client = Octokit::Client.new(access_token: session[:user][:access_token])
    client.create_org_hook('4Soft', { url: 'https://teamtracker2.herokuapp.com/listeners/github', content_type: 'json'},
      { events: ['*'], active: true })

    redirect_to root_path, notice: 'Logado com sucesso'
  end
end
