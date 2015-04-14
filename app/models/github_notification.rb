class GithubNotification
  include Mongoid::Document

  field :event, type: String
  field :payload, type: Hash
end
