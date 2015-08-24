class Feed::IssuesController < ApplicationController
  def index
    @issues = IssueStubFactory.fabric(20, UserStubFactory.fabric(3)).sort { |a, b| b.time <=> a.time }
  end
end
