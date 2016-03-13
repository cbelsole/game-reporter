class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean  :active, default: true
      t.integer  :after_extra_turn_action
      t.integer  :extra_turns, default: 0
      t.integer  :games_per_pairing, null: false
      t.integer  :host_id, null: false
      t.string   :name, null: false
      t.integer  :rounds, null: false
      t.datetime :started_at
      t.integer  :time_per_round
      t.boolean  :use_game_clock, null: false
      t.timestamps null: false
    end
  end
end
