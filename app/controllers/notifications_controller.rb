class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(recipient: current_user)
    render layout: 'no_nav'
    # en.notifications.relationship.message
  end
end
