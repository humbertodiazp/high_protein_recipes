class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_list_items
  has_many :ingredients, through: :shopping_list_items
  validates :name, presence: true
end