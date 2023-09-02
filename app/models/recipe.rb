class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients, dependent: :destroy
    accepts_nested_attributes_for :ingredients, 
        reject_if: :all_blank, allow_destroy: true
    validates :content, presence: true
    has_one_attached :image
    has_rich_text :content 
    has_many :comments, as: :commentable
    has_rich_text :body 
end
