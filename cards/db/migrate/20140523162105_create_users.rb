class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email

      t.integer :energy
      t.integer :shield
      t.integer :hardpoint
      t.integer :speed
      t.integer :fuel
      t.integer :crew
      t.integer :hull
      t.integer :credit

      t.timestamps
    end
  end
end
