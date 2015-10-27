require "test_helper"

class UserTest < ActiveSupport::TestCase
  def user
    @user ||= User.new(self.auth_hash)
  end

  def test_valid
    assert user.valid?
  end
end
