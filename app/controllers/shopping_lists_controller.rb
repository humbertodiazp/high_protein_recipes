class ShoppingListsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]
  
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

      if @shopping_list.update(shopping_list_params)
        redirect_to shopping_list_path(@shopping_list), notice: 'Shopping list updated successfully.'
      else
        render :edit
      end

    end
  
    def destroy
      @shopping_list.destroy
      redirect_to shopping_lists_path, notice: 'Shopping list deleted successfully.'
    end
  
    private
  
    def set_shopping_list
      @shopping_list = current_user.shopping_lists.find(params[:id])
    end
  
    def shopping_list_params
      params.require(:shopping_list).permit(:name)
    end
end
  