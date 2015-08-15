require 'open-uri'
require 'json'

class UserStubFactory

  def self.fabric(n)
    users = Array.new
    n.times do
      users << UserStub.new(username: "John Doe")
      # result = JSON.load(open('https://randomuser.me/api/').read)["results"][0]["user"]
      # users << UserStub.new(username: result["username"], avatar_url: result["picture"]["thumbnail"])
    end
    users
  end

end
