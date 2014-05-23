class User < ActiveRecord::Base
  attr_accessible :username, :password, :email, :energy, :shield, :hardpoint, :speed, :fuel, :crew, :hull, :credit

end
