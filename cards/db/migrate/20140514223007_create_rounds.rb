class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :credit, :default => "0"
      t.integer :energy, :default => "0"
      t.integer :attack, :default => "0"
      t.integer :shield, :default => "0"

      t.timestamps
    end
  end
end
