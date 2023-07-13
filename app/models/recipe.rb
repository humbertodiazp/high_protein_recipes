class Recipe < ApplicationRecord
    has_many :ingredients
    accepts nested atrributes_for :ingredients, 
    reject_if: :all_blank, allow_destroy: true
    belongs_to :user
    validates :title, :description presence :true
    validates :title, length: { minimum: 5 }
    validates :description, length: { minimum: 10 }
end
