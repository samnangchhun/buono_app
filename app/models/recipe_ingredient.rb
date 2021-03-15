class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :ingredient, uniqueness: { scope: :recipe }
end
