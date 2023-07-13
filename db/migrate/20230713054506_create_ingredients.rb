class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :description
      t.string :quantity
      t.string :measure

      t.timestamps
    end
  end
end
