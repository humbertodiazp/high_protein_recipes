# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  deliver_by :database

  param :comment

  def comment
    params[:comment]&.body
  end
  
  def url
    comment_path(params[:comment])
  end
end
