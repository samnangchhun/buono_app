require 'json'

class Parser

  def self.recipes
    recipe_filepath = 'recipe.json'
    serialized_recipes = File.read(recipe_filepath)
    JSON.parse(serialized_recipes)
  end

  def self.ingredients
    ingredients_filepath = 'recipe_ingredients.json'
    serialized_ingredients = File.read(ingredients_filepath)
    JSON.parse(serialized_ingredients)
  end
end
