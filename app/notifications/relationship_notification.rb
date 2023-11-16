# To deliver this notification:
#
# NewFollower.with(follower: @user, followed: @followed).deliver_later(current_useruser)

# (user: @user).deliver_later(current_user)
# NewFollower.with(post: @post).deliver(current_user)

class RelationshipNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :relationship

  # Define helper methods to make rendering easier.
  #
  def relationship
    params[:relationship]&.follower&.full_name
  end
  
  def url 
    relationship_path(params[:relationship])
  end
  
end

