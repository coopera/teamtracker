class PullRequestStubFactory

  def self.fabric(n, users)
    pull_requests = Array.new
    actions = [:opened, :commented, :closed]
    n.times do
      pull_request = PullRequestStub.new(title: 'Some title', time: rand(1.week.ago..Time.now), action: actions.sample, author: users.sample, repo: 'coopera/teamtracker', repo_url: "#", url: "#")
      pull_requests << PullRequestPresenter.new(pull_request)
    end
    pull_requests
  end

end
