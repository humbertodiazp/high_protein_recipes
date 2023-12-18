class ShoppingListItemsController< ApplicationController
  before_action :setup_shopping_list 

  def new
  end

  def destroy
      @shopping_list.shopping_list_items.first.destroy
      redirect_to edit_shopping_list(@shopping_list) 
  end 
  
  def edit
  end 

  def update
  end 

  private

  def set_up_shopping_list
      @shopping_list = Shopping_list.new(shopping_list_items: [Shopping_list_item.new])
  end
end
