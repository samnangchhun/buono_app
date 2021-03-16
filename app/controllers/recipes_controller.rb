class RecipesController < ApplicationController
  before_action :set_recipe, only: :show
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  # def new
  #   @recipe = Recipe.new
  #   authorize @recipe
  # end

  # def create
  #   @recipe = Recipe.new(recipe_params)
  #   authorize @recipe
  #   if @recipe.save
  #     redirect_to recipe_path(@recipe)
  #   else
  #     render :new
  #   end
  # end

  private

  # def recipe_params
  #   params.require(:recipe).permit(:title, :instruction, :cooking_time)
  # end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
