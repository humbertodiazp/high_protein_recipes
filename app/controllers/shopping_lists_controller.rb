class ShoppingListsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]
    def new
        @shopping_list = current_user.shopping_lists.build
        @recipe = Recipe.find(params[:recipe_id])
        
        # Assuming your shopping_list has_many ingredients
        @shopping_list.shopping_list_items.build
    end

    def index
        @shopping_lists = current_user.shopping_lists
    end

    def show
        @shopping_list = current_user.shopping_lists.find_by(id: params[:id])

        if @shopping_list.nil?
            redirect_to shopping_lists_path, alert: 'Shopping list not found.'
        else
            @other_shopping_lists = current_user.shopping_lists.where.not(id: @shopping_list.id)
        end
    end

    def create
        @shopping_list = current_user.shopping_lists.build(shopping_list_params)
        if @shopping_list.save
            respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.update('sidebar', partial: 'sidebar') }
                format.html { redirect_to shopping_list_path(@shopping_list), notice: 'Shopping list was successfully created.' }
            end
        else
            render :new
        end
    end

    private

    # def set_shopping_list
    #     @shopping_list = current_user.shopping_lists.find(params[:id])
    # end
    
    def shopping_list_params
        params.require(:shopping_list).permit(:name, shopping_list_item_ids: [])
    end
end
