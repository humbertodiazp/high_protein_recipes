class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[:show :edit :update :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def new
    @recipe = Recipe.new(ingredients: [Ingredient.new])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
  
      if @recipe.save
        redirect_to @recipe, notice: "Recipe was successfully created."
      else
        @recipe = current_user.recipes.new(recipe_params)
        render 'index', status: :unprocessable_entity
      end
  end



  

  def update
    @recipe.update(recipe_params)
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_recipe
      @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, ingredients_attributes:[:id, :description, :_destroy])
  end
end

