class User < ActiveRecord::Base
  validates :github_id, :token, :name, :avatar_url, :email, :nickname,
            :following_url, :followers_url, :repos_url, :starred_url,
            presence: true



  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(github_id: auth_hash.raw_info.id).first_or_create
    user.update(token: auth_hash.token,
                name: auth_hash.raw_info.name,
                avatar_url: auth_hash.raw_info.avatar_url,
                email: auth_hash.raw_info.email,
                nickname: auth_hash.raw_info.nickname,
                following_url: auth_hash.raw_info.following_url,
                followers_url: auth_hash.raw_info.followers_url,
                repos_url: auth_hash.raw_info.repos_url,
                starred_url: auth_hash.raw_info.starred_url)
    user
  end
end
