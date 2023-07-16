class IngredientsController < ApplicationController
    before_action :setup_recipe 

    def new
    end
  
    def destroy
    end

    private
  
    def setup_recipe
      @recipe = Recipe.new(ingredients: [Ingredient.new])
    end
  end
end
