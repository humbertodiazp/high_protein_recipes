class Ingredient < ApplicationRecord
  belongs_to :recipe
  has_and_belongs_to_many :shopping_lists
  validates :name, presence: true
end
