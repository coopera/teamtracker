class Feed::PullRequestsController < ApplicationController

  def index
    @pull_requests = PullRequestStubFactory.produce(20, UserStubFactory.produce(3)).sort { |a, b| b.time <=> a.time }
    render json: @pull_requests
  end

end
