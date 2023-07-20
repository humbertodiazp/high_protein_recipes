class Ingredient < ApplicationRecord
    belongs_to :recipe, inverse_of: :ingredients
    validates :description, presence: true
end
