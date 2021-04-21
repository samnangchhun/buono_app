# require 'faker'
require 'json'
require 'open-uri'

url = "https://api.spoonacular.com/recipes/random?number=100&apiKey=#{ENV['SPOONACULAR_KEY']}"

filepath = '../../db/recipes.json'
serialized_present_recipe = File.read(filepath)
present_recipe = JSON.parse(serialized_present_recipe)

json_api = open(url).read
result_api = JSON.parse(json_api)

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

puts 'seeding 5 users...'

User.create(email: 'fra@mail.com', password: '123456')
User.create(email: 'mich@mail.com', password: '123456')
User.create(email: 'sam@mail.com', password: '123456')
User.create(email: 'edo@mail.com', password: '123456')
User.create(email: 'lara@mail.com', password: '123456')

puts 'users created'


puts 'seeeding recipes'
serialized_recipes = File.read("db/recipes.json")
recipes = JSON.parse(serialized_recipes)


recipes.each do |recipe_json|
  next if !Recipe.find_by(title: recipe_json['title']).nil?
  # p recipe_json['instruction']
  # p recipe_json['instruction']
  steps = recipe_json['instruction']&.map {|step| step + "\n"}.join
  doses = recipe_json['doses']&.map { |dose| dose + "\n" }.join
  recipe = Recipe.new
  recipe.title = recipe_json['title']
  recipe.instruction = steps
  recipe.doses = doses
  recipe.cooking_time = recipe_json['cooking_time']
  recipe.photo = recipe_json['image']
  recipe.save

  recipe_json['ingredients'].each do |element|
    ingredient = Ingredient.new
    ingredient.name = element
    # ingredient.photo = "#{element}.svg"
    ingredient.save unless Ingredient.find_by(name: element)
    RecipeIngredient.create(recipe: recipe, ingredient: Ingredient.find_by(name: element))
  end
  Review.create(
    rating: rand(1..5),
    content: "",
    recipe: recipe,
    user: User.all.sample
    )
end

puts 'recipes created'

