class Recipe < ApplicationRecord
    has_many :ingredients, dependent: :destroy, inverse_of: :recipe
    accepts_nested_attributes_for :ingredients,
    reject_if: :all_blank, allow_destroy: true
    belongs_to :user
    # validates :title, :instructions, presence: true
    # validates :title, length: { minimum: 5 }
    # validates :instructions, length: { minimum: 10 }
end
