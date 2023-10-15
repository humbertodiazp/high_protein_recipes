class RemoveForeignKeyFromShoppingListItems < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :shopping_list_items, column: :ingredient_id
  end

  def down
    add_foreign_key :shopping_list_items, :ingredients, column: :ingredient_id
  end
end
