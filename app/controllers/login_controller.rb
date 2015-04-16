require 'net/http'

class LoginController < ApplicationController
  def new
    if session[:user]
      redirect_to root_path
    else
      if Rails.env.development?
        session[:user] = { "access_token" => ENV['GH_TT_DEV_TOKEN'] }
        return redirect_to root_path
      end

      redirect_to "https://github.com/login/oauth/authorize?" + 
        "client_id=#{ENV['GH_CLIENT_ID']}" +
        "&scope=admin:org_hook"
    end
  end

  def create
    session[:user] = Octokit.exchange_code_for_token(params["code"],
      ENV['GH_CLIENT_ID'], ENV['GH_CLIENT_SECRET']).to_attrs
    puts session[:user]
    redirect_to root_path, notice: 'Logado com sucesso'
  end
end
