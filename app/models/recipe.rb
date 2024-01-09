class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients
    accepts_nested_attributes_for :ingredients, 
        reject_if: :all_blank, allow_destroy: true
    has_one_attached :image
    has_rich_text :content 
    validates :body, presence: true
    has_many :comments, as: :commentable
    has_many :likes, as: :record


    def liked_by?(user)
        likes.where(user: user).any?
    end

    def like(user)
        likes.where(user: user).first_or_create
    end

    def unlike(user)
        likes.where(user: user).destroy_all
    end
end
