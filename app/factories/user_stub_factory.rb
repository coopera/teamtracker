require 'open-uri'
require 'json'

class UserStubFactory

  def self.fabric(n)
    users = Array.new
    n.times do
      require 'open-uri'
      require 'json'
      user = JSON.load(open('https://randomuser.me/api/')).first.last.first["user"]
      users << UserStub.new(username: user['username'], url: "#", avatar_url: user['picture']['thumbnail'])
    end
    users
  end

end
