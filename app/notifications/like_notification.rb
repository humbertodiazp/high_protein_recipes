class LikeNotification < Noticed::Base
  deliver_by :database, format: :to_database

  def to_database
    {
      type: self.class.name,
      params: params
    }

  end

  param :like

  def message
    "#{params[:like]&.user&.full_name} liked your recipe"
  end

  def url
    likeable = params[:like].likeable

    if likeable.is_a?(Recipe)
      recipe_path(likeable)
    else
      #comment_path(likeable)
    end
  end
end
