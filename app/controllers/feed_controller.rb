class FeedController < ApplicationController
  def index
    @feed_data = (SlackNotification.all.to_a + GithubNotification.all.to_a).sort_by do |x|
      x[:timestamp]
    end.reverse
  end
end
