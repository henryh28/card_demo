class Ship < ActiveRecord::Base
  # attr_accessible :max_energy, :max_shield, :max_hardpoint, :max_speed, :max_fuel, :max_crew, :max_hull, :max_cargo, :cargo_bay

  serialize :cargo_bay
end
