class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients
    accepts_nested_attributes_for :ingredients, 
        reject_if: :all_blank, allow_destroy: true
    has_one_attached :image
    has_rich_text :content 
    validates :content, presence: true
    has_many :comments, as: :commentable
    has_many :likes, as: :record


    def liked_by?(user)
        likes.where(user: user).any?
    end

    def like(user)
        likes.where(user: user).first_or_create
    end

    def unlike(user)
        like_record = likes.find_by(user: user)
    
        if like_record
            like_record.destroy
            notifications.where("params @> ?", { type: "like", user_id: user.id }.to_jsonb.to_s).destroy_all
        end
    end
end
