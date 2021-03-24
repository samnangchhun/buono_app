# require 'faker'
require 'json'
puts 'seeding 5 users...'

User.create(email: 'fra@mail.com', password: '123456')
User.create(email: 'mich@mail.com', password: '123456')
User.create(email: 'sam@mail.com', password: '123456')
User.create(email: 'edo@mail.com', password: '123456')
User.create(email: 'lara@mail.com', password: '123456')

puts 'users created'

# # puts 'seeding 20 ingredients...'

# # 20.times do
# #   Ingredient.create(name: Faker::Food.unique.ingredient)
# # end

# puts 'ingredients created'

# puts 'seeding 10 recipes...'
  # Recipe.create(
  #   title: Faker::Food.unique.dish,
  #   instruction: Faker::Food.description,
  #   cooking_time: rand(10..40)
  # )
# Dir.each_child('db/jsons/recipes') do |file|
#   json = JSON.parse(file)
#   recipe = Recipe.new
#   recipe.title = json['title']
#   recipe.cooking_time = json['readyInMinutes']
#   recipe.photo = json['image']
#   recipe.instruction = json['instructions']
#   p recipe
# end

puts 'seeeding recipes'
serialized_recipes = File.read("db/recipes.json")
recipes = JSON.parse(serialized_recipes)
# ingredients = Dir["db/jsons/ingredients/**/*.json"].sort
# recipes = Dir["db/jsons/recipes/**/*.json"].sort

recipes.each do |recipe_json|
  recipe = Recipe.new
  recipe.title = recipe_json['title']
  recipe.instruction = recipe_json['instruction']
  recipe.cooking_time = recipe_json['cooking_time']
  recipe.photo = recipe_json['image']
  recipe.save

  recipe_json['ingredients'].each do |element|
    ingredient = Ingredient.new
    ingredient.name = element
    ingredient.photo = "#{element}.svg"
    ingredient.save unless Ingredient.find_by(name: element)
    RecipeIngredient.create(recipe: recipe, ingredient: Ingredient.find_by(name: element))
  end
end

puts 'recipes created'

# puts 'joining ingredients and recipe...'

# Recipe.all.each do |recipe|
#   ingredients = Ingredient.all.sample(rand(1..4))
#   ingredients.each do |ingredient|
#     RecipeIngredient.create(recipe: recipe, ingredient: ingredient)
#   end
# end

# puts 'joining done'

# puts 'seeding some reviews'

# Recipe.all[0..2].each_with_index do |recipe, index|
#   (index + 1).times do
#     Review.create(
#       rating: rand(1..5),
#       content: Faker::Restaurant.unique.review,
#       recipe: recipe,
#       user: User.all.sample
#     )
#   end
# end

# puts 'reviews done'

# puts 'seeding some bookmarks...'

# User.all[0..2].each_with_index do |user, index|
#   (index + 1).times do
#     bookmark = Bookmark.new(user: user, recipe: Recipe.all.sample)
#     until bookmark.save
#       bookmark.recipe = Recipe.all.sample
#     end
#   end
# end

# puts 'bookmarks done'


# puts 'seeds completed'
