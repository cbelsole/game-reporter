class CreateRoomsTable < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.integer :game_id
      t.timestamps null: false
    end
  end
end
