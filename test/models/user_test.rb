require "test_helper"

class UserTest < ActiveSupport::TestCase

  def sample_user_data
    {'token' => '123abc',
     'name' => 'Test User',
     'avatar_url' => 'https://avatars.githubusercontent.com/u/4259003?v=3',
     'email' => 'test@user.com',
     'nickname' => 'Tester',
     'following_url' => 'https://api.github.com/users/Egogre/following{/other_user}',
     'followers_url' => 'https://api.github.com/users/Egogre/followers',
     'repos_url' => 'https://api.github.com/users/Egogre/repos',
     'starred_url' => 'https://api.github.com/users/Egogre/starred{/owner}{/repo}',
     'github_id' => '1234'}
  end

  def user
    @user ||= User.new(sample_user_data)
  end

  def test_valid
    assert user.valid?
  end
end
