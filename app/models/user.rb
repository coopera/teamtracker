class User
  include Mongoid::Document

  field :github_login, type: String
  field :github_email, type: String
  field :slack_id, type: String
  field :slack_team_id, type: String
  field :provider, type: String
  field :uid, type: Integer
  field :name, type: String
  field :email, type: String
  field :avatar, type: String
  field :token, type: String
  field :nickname, type: String

  def self.omniauth(auth)
    create! do |user|
      # raise Exception.new auth
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.email = auth['info']['email']
      user.avatar = auth['info']['image']
      user.name = auth['info']['name'] || "" if auth['info']
      user.token = auth['credentials']['token']
      user.nickname = auth['info']['nickname']
    end
  end
end
