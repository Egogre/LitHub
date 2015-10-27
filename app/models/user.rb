class User < ActiveRecord::Base
  validates :github_id, :token, :name, :avatar_url, :email, :nickname,
            :following_url, :followers_url, :repos_url, :starred_url,
            presence: true



  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(github_id: auth_hash.extra.raw_info.id).first_or_create
    user.update(token: auth_hash.credentials.token,
                name: auth_hash.extra.raw_info.name,
                avatar_url: auth_hash.extra.raw_info.avatar_url,
                email: auth_hash.extra.raw_info.email,
                nickname: auth_hash.extra.raw_info.login,
                following_url: auth_hash.extra.raw_info.following_url,
                followers_url: auth_hash.extra.raw_info.followers_url,
                repos_url: auth_hash.extra.raw_info.repos_url,
                starred_url: auth_hash.extra.raw_info.starred_url)
    user
  end
end
