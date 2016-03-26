class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users do |t|
      t.integer :game_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
