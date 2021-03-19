require 'json'

class Parser
  # def self.recipes
  #   recipe_filepath = '../db/recipe.json'
  #   serialized_recipes = File.read(recipe_filepath)
  #   JSON.parse(serialized_recipes)
  # end

  def self.parse_json
    apikey = "c230327f3f7043b1b2990425b5e59e12"
    recipes_filepath = File.join(__dir__, "../../db/jsons/recipes.json")
    serialized_recipes = File.read(recipes_filepath)
    recipes = JSON.parse(serialized_recipes)
    id_recipes = recipes.map { |id_recipe| id_recipe['id'] }
    id_recipes.each do |id|
      url_recipes = "https://api.spoonacular.com/recipes/#{id}/ingredientWidget.json?apiKey=#{apikey}"
      Fetch.fetch(url_recipes, id, "ingredients")
    end
  end

  # def self.parse_json(filepath)
  #   JSON.parse(File.read(filepath))
  # end
end
