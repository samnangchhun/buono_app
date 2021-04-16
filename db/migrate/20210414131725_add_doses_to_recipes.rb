class AddDosesToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :doses, :string
  end
end
