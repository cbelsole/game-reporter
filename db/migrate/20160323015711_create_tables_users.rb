class CreateTablesUsers < ActiveRecord::Migration
  def change
    create_table :tables_users do |t|
      t.integer :table_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
