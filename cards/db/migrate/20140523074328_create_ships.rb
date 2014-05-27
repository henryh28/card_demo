class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.integer :max_energy, :default => "5"
      t.integer :max_shield, :default => "5"
      t.integer :max_hardpoint, :default => "1"
      t.integer :max_speed, :default => "2"
      t.integer :max_fuel, :default => "3"
      t.integer :max_crew, :default => "4"
      t.integer :max_hull, :default => "5"
      t.integer :max_cargo, :default => "10"
      t.text :cargo_bay

      t.timestamps
    end
  end
end
