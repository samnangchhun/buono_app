# require 'json'

# class Parser
  # def self.recipes
  #   recipe_filepath = '../db/recipe.json'
  #   serialized_recipes = File.read(recipe_filepath)
  #   JSON.parse(serialized_recipes)
  # end

  # def self.parse_json
  #   apikey = "c230327f3f7043b1b2990425b5e59e12"
  #   recipes_filepath = File.join(__dir__, "../../db/jsons/recipes.json")
  #   serialized_recipes = File.read(recipes_filepath)
  #   recipes = JSON.parse(serialized_recipes)
  #   id_recipes = recipes.map { |id_recipe| id_recipe['id'] }
  #   id_recipes.each do |id|
  #     url_ingredients = "https://api.spoonacular.com/recipes/#{id}/ingredientWidget.json?apiKey=#{apikey}"
  #     Fetch.fetch(url_ingredients, id, "ingredients")
  #   end
  # end

  # def self.parse_json(filepath)
  #   JSON.parse(File.read(filepath))
  # end

  # url_recipes = "https://api.spoonacular.com/recipes/#{id}/information?apiKey=#{apikey}&includeNutrition=false"
  # url_ingredients = "https://api.spoonacular.com/recipes/#{id}/ingredientWidget.json?apiKey=#{apikey}"
# end
require 'json'
require 'open-uri'

apikey = "669c112e843d435184d6dc6937854e88"
url = "https://api.spoonacular.com/recipes/random?number=100&apiKey=#{apikey}"

filepath = '../../db/recipes.json'
serialized_present_recipe = File.read(filepath)
present_recipe = JSON.parse(serialized_present_recipe)

json_api = open(url).read
result_api = JSON.parse(json_api)

# result_api.each do |recipe|
#   present_recipe << recipe unless present_recipe.include?(recipe)
# end
# p result_api['recipes'].class

new_recipes = result_api['recipes'].map do |recipe|
  next if recipe['instructions'].nil? || recipe['image'].nil? || recipe['analyzedInstructions'].first.nil? || recipe['extendedIngredients'].nil?

  if !recipe['analyzedInstructions'].empty?
    steps = recipe['analyzedInstructions'][0]['steps'].map { |e| e['step'] }
  end

  next if steps.include?('Email')

  if !recipe['extendedIngredients'].empty?
    ingredients = recipe['extendedIngredients'].map { |ing| ing['name'] }
    doses = recipe['extendedIngredients'].map { |ing| ing['original'] }
  end

  {
    title: recipe['title'],
    image: recipe['image'],
    cooking_time: recipe['readyInMinutes'],
    instruction: steps,
    ingredients: ingredients.uniq,
    doses: doses,
  }
end

new_recipes.each do |recipe|
  present_recipe << recipe unless present_recipe.include?(recipe)
end

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(present_recipe))
end
