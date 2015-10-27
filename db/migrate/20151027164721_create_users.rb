class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_id
      t.string :token
      t.string :name
      t.string :avatar_url
      t.string :email
      t.string :nickname
      t.string :following_url
      t.string :followers_url
      t.string :repos_url
      t.string :starred_url

      t.timestamps null: false
    end
  end
end
