class Ingredient < ApplicationRecord
    belongs_to :recipe
    validates :description, :quantity, :measure, presence: true
end
