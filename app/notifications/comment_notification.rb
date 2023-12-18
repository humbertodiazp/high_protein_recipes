class CommentNotification < Noticed::Base
  deliver_by :database, format: :to_database

  def to_database
    {
      type: self.class.name,
      params: params
    }
  end

  param :comment

  def message
    "#{params[:comment]&.user&.full_name} commented on your recipe"
  end

  def url
    commentable = params[:comment].commentable
    user = params[:comment].user

    if commentable.is_a?(Recipe)
      recipe_path(commentable)
    else
      
    end
  end

end
