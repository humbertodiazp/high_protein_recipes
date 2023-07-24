class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :description
      t.string :quantity
      t.string :measurement
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
