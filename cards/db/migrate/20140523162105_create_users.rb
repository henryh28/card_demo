class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email

      t.integer :energy, :default => "0"
      t.integer :shield, :default => "0"
      t.integer :hardpoint, :default => "0"
      t.integer :speed, :default => "0"
      t.integer :fuel, :default => "0"
      t.integer :crew, :default => "0"
      t.integer :hull, :default => "0"
      t.integer :credit, :default => "0"
      t.integer :attack, :default => "0"
      t.integer :cargo, :default => "0"
      t.text :cargo_bay

      t.timestamps
    end
  end
end
