
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
