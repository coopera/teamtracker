class GithubNotification
  include Mongoid::Document

  field :event, type: String
  field :payload, type: Hash
  field :timestamp, type: DateTime
end
