class GithubNotification
  include Mongoid::Document

  field :event, type: String
  field :payload, type: Hash
  field :timestamp, type: DateTime

  def self.pull_requests
    self.where(event: "pull_request")
  end

end
