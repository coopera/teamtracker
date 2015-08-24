class IssuePresenter < ApplicationPresenter

  def info
    %(<a href="#{model.author.url}">#{model.author.username}</a> #{model.action} <a href="#{model.url}">#{model.title}</a> in <a href="#{model.repo_url}">#{model.repo}</a>).html_safe
  end

end
