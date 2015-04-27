class FeedController < ApplicationController
  def index
    @team_info = TeamInfo.first
    @feed_data = (SlackNotification.all.to_a + GithubNotification.all.to_a).sort_by do |x|
      x[:timestamp]
    end.reverse
  end

  def slack
    @team_info = TeamInfo.first
    @feed_data = SlackNotification.all.to_a.sort_by { |x| x[:timestamp] }.reverse
    render :index
  end
end
