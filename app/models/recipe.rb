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
end
