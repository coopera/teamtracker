class Feed::PullRequestsController < ApplicationController

  def index
    @pull_requests = GithubNotification.pull_requests
  end

end
