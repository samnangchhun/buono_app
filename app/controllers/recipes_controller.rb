class RecipesController < ApplicationController
  before_action :set_recipe, only: :show
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:ingredients].present?
      # @recipess = Recipe.joins(:recipe_ingredients).where(recipe_ingredients: { ingredient_id: params[:ingredients] })
      @recipes = Recipe.match(params[:ingredients])
      # .map { |recipe| recipe[:recipe] }
    else
      @recipes = Recipe.all.sort_by { |recipe| recipe.cooking_time }
    end
  end

  def show
    @recipes = Recipe.all.limit(2)
    # @recipes = Recipe.joins(:recipe_ingredients).where(recipe_ingredients: { ingredient_id: @recipes.ingredients.first.id })
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
