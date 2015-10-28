require "test_helper"

class GithubUserTest < ActiveSupport::TestCase

  def sample_user_data
    OpenStruct.new({
      'credentials' => OpenStruct.new({
        'token' => '123abc'
      }),
      'extra' => OpenStruct.new({
        'raw_info' => OpenStruct.new({
          'name' => 'Test User',
          'avatar_url' => 'https://avatars.githubusercontent.com/u/4259003?v=3',
          'email' => 'test@user.com',
          'login' => 'Tester',
          'following_url' => 'https://api.github.com/users/Tester/following{/other_user}',
          'followers_url' => 'https://api.github.com/users/Tester/followers',
          'repos_url' => 'https://api.github.com/users/Tester/repos',
          'starred_url' => 'https://api.github.com/users/Tester/starred{/owner}{/repo}',
          'id' => '1234'
        })
      })
    })
  end


  def user
    @user ||= GithubUser.new(sample_user_data)
  end

  def test_user_returns_active_record_like_attributes
    assert_equal '123abc', user.token
    assert_equal '1234', user.id
    assert_equal 'Test User', user.name
    assert_equal 'test@user.com', user.email
    assert_equal 'https://avatars.githubusercontent.com/u/4259003?v=3', user.avatar_url
    assert_equal 'Tester', user.login
  end

  def test_it_gives_correctly_formatted_urls
    assert_equal 'https://api.github.com/users/Tester', user.git_hub_root
    assert_equal 'https://api.github.com/users/Tester/following', user.following_url
    assert_equal 'https://api.github.com/users/Tester/followers', user.followers_url
    assert_equal 'https://api.github.com/users/Tester/repos', user.repos_url
    assert_equal 'https://api.github.com/users/Tester/starred', user.starred_url
    assert_equal 'https://api.github.com/users/Tester/orgs', user.organizations_url
  end

end
