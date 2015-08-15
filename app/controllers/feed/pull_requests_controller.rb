class Feed::PullRequestsController < ApplicationController

  def index
    @pull_requests = PullRequestStubFactory.fabric(20, UserStubFactory.fabric(5))
  end

end
