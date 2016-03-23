class CreateTablesTable < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name, null: false
      t.integer :room_id, null: false
      t.timestamps null: false
    end
  end
end
