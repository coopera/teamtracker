class IssueStubFactory

  def self.produce(n, users)
    issues = Array.new
    actions = [:opened, :commented, :closed]
    n.times do
      issue = IssueStub.new(title: 'Some title', time: rand(1.week.ago..Time.now), action: actions.sample, author: users.sample, repo: 'coopera/teamtracker', repo_url: "#", url: "#")
      issues << IssuePresenter.new(issue)
    end
    issues
  end

end
