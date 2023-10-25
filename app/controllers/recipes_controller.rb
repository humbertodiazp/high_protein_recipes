class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  respond_to :html

  def index
    @recipes = Recipe.all
  end



  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments
    @user_shopping_lists = current_user.shopping_lists
    render layout: 'no_nav'
  end
  
  
  def new
    @recipe = Recipe.new(ingredients: [Ingredient.new])
    render layout: 'no_nav' 

  end
  

  def edit
    
    render layout: 'no_nav' 

  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_shopping_list
    @recipe = Recipe.find(params[:id])
    shopping_list_id = params[:recipe][:shopping_list_id]
  
    if shopping_list_id.present?
      shopping_list = ShoppingList.find(shopping_list_id)
    else
      # Create a new shopping list if one was not selected
      shopping_list = current_user.shopping_lists.create(name: params[:recipe][:new_shopping_list])
    end
  
    @recipe.ingredients.each do |ingredient|
      shopping_list_item = shopping_list.shopping_list_items.build(
        description: ingredient.description,
        ingredient_id: ingredient.id # Provide the ingredient_id
      )
      shopping_list_item.save
    end
  
    redirect_to @recipe, notice: 'Ingredients added to the shopping list.'
  end
  
  
  
  

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.redirect(@recipe)
        end
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
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
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).
      permit(:name, :content, :image, ingredients_attributes: 
        [:id, :description, :quantity, :measurement, :_destroy])    
    end
end
