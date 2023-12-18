class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications 
    render layout: 'no_nav'
    # en.notifications.relationship.message
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.mark_as_read!
  
    redirect_to @notification.url
  end
  
  
  
  
  def show
    @notification = Notification.find(params[:id])
    @notification.mark_as_read!
    render layout: 'no_nav'
  end
end
