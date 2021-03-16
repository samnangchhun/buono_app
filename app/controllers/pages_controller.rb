class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :fridge]

  def home
  end

  def fridge
    @fridge = Ingredient.new
  end
end
