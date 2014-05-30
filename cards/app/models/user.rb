class User < ActiveRecord::Base
  # attr_accessible :username, :password, :email, :energy, :shield, :hardpoint, :speed, :fuel, :crew, :hull, :credit, :attack, :max_cargo, :cargo_bay

  serialize :cargo_bay
end
