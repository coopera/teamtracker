class User
  include Mongoid::Document

  field :github_login, type: String
  field :github_email, type: String
  field :slack_id, type: String
  field :slack_team_id, type: String

  def self.omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name'] || "" if auth['info']
    end
  end
end
