class AddSteamNicknameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :steam_name, :string, unique: true
  	add_index :users, :steam_name
  	add_index :users, :steam_id
  end
end
