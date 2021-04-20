class ChangeCookingTimeToRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :cooking_time, :float
    add_column :recipes, :cooking_time, :integer
  end
end
