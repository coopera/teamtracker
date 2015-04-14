class User
  include Mongoid::Document
  
  field :github_login, type: String
  field :github_email, type: String
  field :slack_id, type: String
  field :slack_team_id, type: String
end
