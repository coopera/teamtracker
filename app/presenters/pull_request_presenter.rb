class PullRequestPresenter < ApplicationPresenter

  attr_accessor :pull_request

  def initialize(pull_request)
    @pull_request = pull_request
    super(pull_request)
  end

  def info
    %(<a href="#{self.author.url}">#{self.author.username}</a> #{self.action} <a href="#{self.url}">#{self.title}</a> in <a href="#{self.repo_url}">#{self.repo}</a>).html_safe
  end

end
