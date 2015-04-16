class Listeners::GithubController < ApplicationController
  def new
    client = Octokit::Client.new(access_token: session[:user]["access_token"])
    @organizations = client.organizations
  end

  def create
    client = Octokit::Client.new(access_token: session[:user]["access_token"])
    client.create_org_hook(params[:organization],
      { url: 'https://teamtracker2.herokuapp.com/listeners/github/webhook', content_type: 'json'},
      { events: ['*'], active: true })
  end

  def webhook
  end
end
