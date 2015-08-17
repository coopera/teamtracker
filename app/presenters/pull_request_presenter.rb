class PullRequestPresenter < ApplicationPresenter

  attr_accessor :pull_request

  def initialize(pull_request)
    @pull_request = pull_request
    super(pull_request)
  end

end
