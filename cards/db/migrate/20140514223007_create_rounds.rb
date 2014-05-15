class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
        t.integer :buy
        t.integer :action
        t.integer :credit

      t.timestamps
    end
  end
end
