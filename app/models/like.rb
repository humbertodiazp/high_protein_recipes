class Like < ApplicationRecord
  belongs_to :user
  belongs_to :record, polymorphic: true, counter_cache: true
  has_noticed_notifications

  after_create_commit :notify_user

  def notify_user
    if user != record.user
      LikeNotification.with(like: self).deliver_later(record.user)
    end 
  end

  def likeable
    record
  end





end
