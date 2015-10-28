class Repo < OpenStruct

  def self.all(user)
    GitInfoParser.new(user).repos.map do |repo_data|
      Repo.new(repo_data)
    end
  end

  def initialize(repo)
    @id = repo[:id]
    @name = repo[:name]
  end

end
