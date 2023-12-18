class Comment < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: "Comment"
  has_many :comments, foreign_key: :parent_id, dependent: :destroy

  has_noticed_notifications

  has_rich_text :body

  validates :body, presence: true

  after_create_commit :notify_user

  def notify_user
    recipe_owner = commentable.user

    # Check if the comment's user is different from the recipe's owner
    if user != recipe_owner
      CommentNotification.with(comment: self).deliver_later(recipe_owner)
    end
  end

  after_create_commit do
    broadcast_append_to [commentable, :comments], target: "#{dom_id(parent || commentable)}_comments", partial: "comments/comment_with_replies"
  end

  after_update_commit do
    broadcast_replace_to self
  end

  after_destroy_commit do
    broadcast_remove_to self
    broadcast_action_to self, action: :remove, target: "#{dom_id(self)}_with_comments"
  end
end
