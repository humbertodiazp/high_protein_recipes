class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    validates :follower_id, presence: true
    validates :followed_id, presence: true

    has_noticed_notifications

    after_create_commit :notify_user

    def notify_user
        RelationshipNotification.with(relationship: self).deliver_later(followed)
    end 
end
