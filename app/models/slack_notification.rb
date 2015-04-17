class SlackNotification
  include Mongoid::Document
  
  field :text, type: String
  field :channel_id, type: String
  field :user_id, type: String
  field :timestamp, type: DateTime
end
