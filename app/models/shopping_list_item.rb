class ShoppingListItem < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :ingredients
  validates :description, presence: true
end
