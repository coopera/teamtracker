class Feed::PullRequestsController < ApplicationController

  def index
    @pull_requests = PullRequestStubFactory.fabric(20, UserStubFactory.fabric(3)).sort { |a, b| b.time <=> a.time }
  end

end
