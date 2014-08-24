class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :appid
      t.string :name
      t.integer :playtime_forever
      t.string :icon_url
      t.string :logo_url
      t.boolean :has_community_visible_stats
      t.timestamps
      t.references :user
    end
    add_index :games, :user_id
  end
end
