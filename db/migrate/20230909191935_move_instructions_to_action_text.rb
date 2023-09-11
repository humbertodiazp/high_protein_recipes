class MoveInstructionsToActionText < ActiveRecord::Migration[7.0]
  def change
    Recipe.all.find_each do |recipe|
      recipe.update(content: recipe.instructions)
    end
    remove_column :recipes, :instructions
  end
end