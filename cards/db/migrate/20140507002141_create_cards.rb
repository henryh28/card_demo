class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :card_type
      t.string :effect
      t.string :modifier
      t.string :efficiency
      t.string :flavor_text
      t.string :cost

      t.belongs_to :deck, index: true

      t.timestamps
    end
  end
end
