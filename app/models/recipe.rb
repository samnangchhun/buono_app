class Recipe < ApplicationRecord
  has_many :bookmarks
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews
end
