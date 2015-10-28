require "test_helper"

class NewAccountTest < Capybara::Rails::TestCase

  def test_guest_can_create_new_account
    visit root_path
    click_on("Login With GitHub")
    save_and_open_page
    assert_equal dashboard_path, current_path
    within('#user_info') do
      assert page.has_content?('Tester')
      assert page.has_content?('Test User')
      assert page.has_content?('test@user.com')
    end
  end

end
