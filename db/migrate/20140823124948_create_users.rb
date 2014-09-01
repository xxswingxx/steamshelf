class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :steam_id
      t.string :steam_name


      t.timestamps
    end

    add_index :users, :steam_name, unique: true
  end
end
