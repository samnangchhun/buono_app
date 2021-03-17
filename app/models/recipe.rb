class Recipe < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews


  def rating_average
    reviews = self.reviews
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    sum / reviews.length
  end

  def self.match(ingredients)
    recipes = Recipe.joins(:recipe_ingredients).where(recipe_ingredients: { ingredient_id: ingredients })
    recipes = recipes.map { |recipe| recipe.id }
    priorities = recipes.uniq.map { |recipe| { recipe: Recipe.find_by(id: recipe), matching_ingredients: recipes.count(recipe) } }
    priorities = priorities.map do |hash|
      {
        matching_ingredients: hash[:matching_ingredients],
        recipes: priorities.map do |recipe|
          recipe[:recipe] if recipe[:matching_ingredients] == hash[:matching_ingredients]
        end.compact
      }
    end.uniq
    priorities.sort_by { |hash| -hash[:matching_ingredients] }
  end
  
end
