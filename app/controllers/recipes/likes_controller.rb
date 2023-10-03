class Recipes::LikesController < ApplicationController 
    include ActionView::RecordIdentifier
    before_action :authenticate_user!
    before_action :set_recipe

    def update 
        if @recipe.liked_by?(current_user)
            @recipe.unlike(current_user)
        else
            @recipe.like(current_user)
        end

        respond_to do |format|
            format.turbo_stream {
                render turbo_stream: turbo_stream.replace(dom_id(@recipe, :likes), partial: "recipes/likes", locals: { recipe: @recipe })
            }
        end 
    end

    private

    def set_recipe 
        @recipe = Recipe.find(params[:recipe_id])
    end
end