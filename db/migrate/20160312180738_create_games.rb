class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean  :active, default: true
      t.datetime :started_at
      t.integer  :host_id
      t.string   :name
      t.timestamps null: false
    end
  end
end
