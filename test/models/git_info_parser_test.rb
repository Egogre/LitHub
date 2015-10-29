require 'test_helper'

class GitInfoParserTest < ActiveSupport::TestCase
  attr_reader :parser

  def setup
    user = {git_hub_root: 'https://api.github.com/users/Egogre'}
    @parser = GitInfoParser.new(user)
  end

  def test_repos
    VCR.use_cassette('git_info_parser#repos') do
      repo_info = parser.repos

      assert_equal 30, repo_info.count
    end
  end

end
