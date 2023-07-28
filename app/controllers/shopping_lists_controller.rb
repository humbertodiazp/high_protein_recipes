class ShoppingListsController < ApplicationController
    # app/controllers/shopping_lists_controller.rb
class ShoppingListsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @shopping_lists = current_user.shopping_lists
    end
  
    def show
      @shopping_list = current_user.shopping_lists.find(params[:id])
    end
  
    def new
      @shopping_list = current_user.shopping_lists.build
    end
  
    def create
      @shopping_list = current_user.shopping_lists.build(shopping_list_params)
      if @shopping_list.save
        redirect_to @shopping_list, notice: 'Shopping list was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def shopping_list_params
      params.require(:shopping_list).permit(:name, ingredient_ids: [])
    end
  end
  
end
