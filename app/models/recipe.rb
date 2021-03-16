class Recipe < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews
end
