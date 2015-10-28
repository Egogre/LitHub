class MainInfo
  attr_reader :avatar_url,
              :nickname,
              :name,
              :email,
              :public_repos,
              :followers,
              :following

  def initialize(user)
    user_info = GitInfoParser.new(user).main_info
    @avatar_url = user_info[:avatar_url]
    @nickname = user_info[:login]
    @name = user_info[:name]
    @email = user_info[:email]
    @public_repos = user_info[:public_repos]
    @followers = user_info[:followers]
    @following = user_info[:following]
  end

end
