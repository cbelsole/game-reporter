class AddCodeToGame < ActiveRecord::Migration
  def change
    add_column :games, :code, :string #make this null: false when you merge it.
  end
end
