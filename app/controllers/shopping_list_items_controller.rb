class ShoppingListItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_shopping_list
    before_action :set_shopping_list_item, only: [:destroy]
  
    def new_ingredient
      @shopping_list_item = @shopping_list.shopping_list_items.build
    end
    

    def create
      @shopping_list_item = @shopping_list.shopping_list_items.build(ingredient_params)
      if @shopping_list_item.save
        redirect_to edit_shopping_list_path(@shopping_list), notice: 'Ingredient added to the shopping list.'
      else
        render :new_ingredient
      end
    end
  
    def destroy
      @ingredient = ShoppingListItem.find(params[:id])
      @shopping_list = @ingredient.shopping_list
    
      if @ingredient.destroy
        render turbo_stream: [
          turbo_stream.remove("ingredient_#{@ingredient.id}")
        ]
      else
        redirect_to edit_shopping_list_path(@shopping_list), alert: 'Ingredient could not be removed from the shopping list.'
      end
    end
    
    
    
  
    private
  
    def set_shopping_list
      @shopping_list = current_user.shopping_lists.find(params[:shopping_list_id])
    end
  
    def set_shopping_list_item
      @shopping_list_item = @shopping_list.shopping_list_items.find(params[:id])
    end
  
    def ingredient_params
      params.require(:ingredient).permit(:description)
    end
  end
  