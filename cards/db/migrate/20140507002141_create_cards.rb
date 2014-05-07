class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :card_type
      t.string :effect
      t.integer :modifier

      t.timestamps
    end
  end
end
