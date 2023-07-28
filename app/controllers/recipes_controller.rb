class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]


  respond_to :html

  def index
    @recipes = Recipe.all
  end

  def show
  end

  
  def new
    @recipe = Recipe.new(ingredients: [Ingredient.new])
  end
  

  def edit
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    # @recipe.ingredient_id = @ingredient.id
    @recipe.save
    respond_with(@recipe)
  end

  def update
    @recipe.update(recipe_params)
    respond_with(@recipe)
  end

  def destroy
    @recipe.destroy
    respond_with(@recipe)
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).
      permit(:name, :instructions, ingredients_attributes: 
        [:id, :description, :quantity, :measurement, :_destroy])    
    end
end
