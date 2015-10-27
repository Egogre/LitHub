ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def self.sample_auth_hash
    OpenStruct.new({
      'token' => '123abc',
      'raw_info' => OpenStruct.new({
        'name' => 'Test User',
        'avatar_url' => 'https://avatars.githubusercontent.com/u/4259003?v=3',
        'email' => 'test@user.com',
        'nickname' => 'Tester',
        'following_url' => 'https://api.github.com/users/Egogre/following{/other_user}',
        'followers_url' => 'https://api.github.com/users/Egogre/followers',
        'repos_url' => 'https://api.github.com/users/Egogre/repos',
        'starred_url' => 'https://api.github.com/users/Egogre/starred{/owner}{/repo}',
        'id' => '1234'
      })
    })
  end

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = sample_auth_hash
end
