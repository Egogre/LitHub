require 'hurley'

class GitInfoParser
  attr_reader :connection

  def initialize(user)
    user = GithubUser.rebuild(user)
    @connection = Hurley::Client.new(user.git_hub_root)
  end

  def repos
    parse('repos')
  end

  def following
    parse('following')
  end

  def followers
    parse('followers')
  end

  def starred
    parse('starred')
  end

  def orgs
    parse('orgs')
  end

  def parse(response)
    JSON.parse(connection.get(response).body, symbolize_names: true)
  end

end
