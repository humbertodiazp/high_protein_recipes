class ShoppingListsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]


    def new
        @shopping_list = ShoppingList.new
        @recipe = Recipe.find(params[:recipe_id])
        
        # Create new ShoppingListItem and Ingredients for the shopping list
        @shopping_list.shopping_list_items.build(ingredients: @recipe.ingredients.map { |ingredient| Ingredient.new(description: ingredient.description) })
        
        render layout: 'no_nav'
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
        @shopping_list = current_user.shopping_lists.new(shopping_list_params)
        respond_to do |format|
            if @shopping_list.save 
                format.html { redirect_to @shopping_list, notice: 'Shopping List was successfully created.' }
                format.json { render :show, status: :created, location: @shopping_list }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @shopping_list.update(shopping_list_params)
                format.html { redirect_to @shopping_list, notice: 'Shopping List was successfully updated.' }
                format.json { render :show, status: :ok, location: @shopping_list }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
            end
        end
    end


    def edit
    end 


    # def update
    #     respond_to do |format|
    #         if @shopping_list.update(shopping_list_params)
    #             format.html { redirect_to @shopping_list, notice: 'Shopping List was successfully updated.' }
    #             format.json { render :show, status: :ok, location: @shopping_list }
    #         else
    #             format.html { render :edit, status: :unprocessable_entity }
    #             format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
    #         end
    #     end
    # end

    def destroy
        @shopping_list.destroy
        respond_to do |format|
            format.html { redirect_to shopping_lists_url, notice: 'Shopping List was successfully deleted.' }
            format.json { head :no_content }
        end
    end


    private


    def set_shopping_list
        @shopping_list = current_user.shopping_lists.find(params[:id])
    end
    


    def shopping_list_params
        params.require(:shopping_list).permit(
            :name,
            shopping_list_items_attributes: [
            :id,
            ingredients_attributes: [:id, :description, :quantity, :measurement, :_destroy]
            ]
        )
    end
end 

