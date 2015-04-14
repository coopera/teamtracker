class SlackNotification
  include Mongoid::Document
  
  field :team_id, type: String
  field :team_domain, type: String
  field :channel_id, type: String
  field :channel_name, type: String
  field :timestamp, type: String
  field :user_id, type: String
  field :user_name, type: String
  field :text, type: String
  field :trigger_word, type: String
end
