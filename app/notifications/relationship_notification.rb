
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
  def to_database
    {
      type: self.class.name,
      params: params 
    }
  end

  param :relationship

  # Define helper methods to make rendering easier.
  #
  def message
    "#{params[:relationship]&.follower&.full_name} started following you"
  end
  
  def url 
    follower = params[:relationship]&.follower
    user_path(follower) if follower.present?  end
  
end

