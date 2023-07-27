class CreateShoppingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    create_table :shopping_lists_ingredients do |t|
      t.references :shopping_list, foreign_key: true
      t.references :ingredient, foreign_key: true
    end
  end
end