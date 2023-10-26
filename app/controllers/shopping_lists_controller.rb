class ShoppingListsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]
    before_action :set_shopping_list_item, only: [:new, :edit, :update, :destroy]
    def index
      @shopping_lists = current_user.shopping_lists
      render layout: 'no_nav'
    end
  
    def show
      # You can display the shopping list and its items here.
      render layout: 'no_nav'
    end
  
    def new
      @shopping_list = ShoppingList.new
    end
  
    def create
      @shopping_list = current_user.shopping_lists.new(shopping_list_params)
      if @shopping_list.save
        redirect_to shopping_list_path(@shopping_list), notice: 'Shopping list created successfully.'
      else
        render :new
      end
    end
  
    def edit
      render layout: 'no_nav'
    end

    def update
      respond_to do |format|
        if @shopping_list.update(shopping_list_params)
          format.html { redirect_to @shopping_list, notice: 'Shopping   List was successfully updated.' }
          format.json { render :show, status: :ok, location: @shopping_list }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @shopping_list.destroy
      redirect_to shopping_lists_path, notice: 'Shopping list deleted successfully.'
    end
    
    # shopping list items actions
    # def new_ingredient
    #   @shopping_list = ShoppingList.find(params[:shopping_list_id])
    #   @ingredient = @shopping_list.shopping_list_items.build
    # end
    
    # def create_ingredient
    #   @shopping_list = ShoppingList.find(params[:shopping_list_id])
    #   @ingredient = @shopping_list.shopping_list_items.build(ingredient_params)
    #   if @ingredient.save
    #     redirect_to edit_shopping_list_path(@shopping_list), notice: 'Ingredient added to the shopping list.'
    #   else
    #     render :new_ingredient
    #   end
    # end
    
    # def remove_ingredient
    #   @shopping_list = ShoppingList.find(params[:shopping_list_id])
    #   @ingredient = @shopping_list.shopping_list_items.find(params[:id])
    #   @ingredient.destroy
    #   redirect_to edit_shopping_list_path(@shopping_list), notice: 'Ingredient removed from the shopping list.'
    # end
    
    private

    # def set_ingredient 
    #   @ingredient = @shopping_list.shopping_list_items.build
    # end


    # def ingredient_params
    #   params.require(:ingredient).permit(:description)
    # end
    
    def set_shopping_list_item
      @shopping_list_item = @shopping_list.shopping_list_items.find(params[:id])
    end
  
    def set_shopping_list
      @shopping_list = current_user.shopping_lists.find(params[:id])
    end
  
    def shopping_list_params
      params.require(:shopping_list).permit(:name, shopping_list_items_attributes: [:id, :description, :_destroy])
    end
end
  