class GithubNotification
  include Mongoid::Document

  field :event, type: String
  field :payload, type: Hash
  field :issued_at, type: DateTime
end
