class PullRequestStubFactory

  def self.fabric(n, users)
    pull_requests = Array.new
    n.times do
      actions = [:opened, :commented, :closed]
      pull_requests << PullRequestStub.new(title: 'Some title', time: Time.now, action: actions.sample, author: users.sample)
    end
    pull_requests
  end

end
