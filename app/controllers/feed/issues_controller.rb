class Feed::IssuesController < ApplicationController
  def index
    @issues = IssueStubFactory.produce(20, UserStubFactory.produce(3)).sort { |a, b| b.time <=> a.time }
  end
end
