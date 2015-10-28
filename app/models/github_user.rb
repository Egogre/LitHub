class GithubUser
  attr_accessor :token,
                :id,
                :login,
                :name,
                :avatar_url,
                :email,
                :following,
                :followers,
                :public_repos

  def initialize(user_data = nil)
    if user_data
      @token = user_data.credentials.token
      @id = user_data.extra.raw_info.id
      @login = user_data.extra.raw_info.login
      @name = user_data.extra.raw_info.name
      @avatar_url = user_data.extra.raw_info.avatar_url
      @email = user_data.extra.raw_info.email
      @following = user_data.extra.raw_info.following
      @followers = user_data.extra.raw_info.followers
      @public_repos = user_data.extra.raw_info.public_repos
    end
  end

  def self.rebuild(user)
    github_user = new
    user.each do |attribute, value|
      github_user.instance_variable_set("@#{attribute}", value)
    end
    github_user
  end

  def git_hub_root
    "https://api.github.com/users/#{login}"
  end

  def repos_url
    "#{git_hub_root}/repos"
  end

  def following_url
    "#{git_hub_root}/following"
  end

  def followers_url
    "#{git_hub_root}/followers"
  end

  def starred_url
    "#{git_hub_root}/starred"
  end

  def organizations_url
    "#{git_hub_root}/orgs"
  end

end
