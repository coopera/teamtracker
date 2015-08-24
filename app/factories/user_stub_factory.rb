require 'open-uri'
require 'json'

class UserStubFactory

  def self.fabric(n)
    users = Array.new
    n.times do
      user = JSON.load(open('https://randomuser.me/api/')).first.last.first["user"]
      user_stub = UserStub.new(username: user['username'], url: "#", avatar_url: user['picture']['thumbnail'])
      users << UserPresenter.new(user_stub)
    end
    users
  end

end
