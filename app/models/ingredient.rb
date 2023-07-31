class Ingredient < ApplicationRecord
  belongs_to :recipe
  has_many :shopping_list_items
  has_many :shopping_lists, through: :shopping_list_items
  validates :description, presence: true
end
