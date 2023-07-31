class CreateShoppingListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_list_items do |t|
      t.string :description
      t.references :shopping_list, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
