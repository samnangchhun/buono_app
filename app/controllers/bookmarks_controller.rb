class BookmarksController < ApplicationController
  before_action :set_recipe, only: :create
  before_action :set_bookmark, only: :destroy

  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.recipe = @recipe
    @bookmark.save
    if params[:page] == 'bookmarks/index'
      respond_to do |format|
      format.js { render partial: "bookmarks/update_bookmark_index_card" }
      end
    else
      respond_to do |format|
      format.js { render partial: "bookmarks/update_bookmark_card" }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(@bookmark.recipe.id)
    @bookmark.destroy
    if params[:page] == 'show'
      respond_to do |format|
      format.js { render partial: "bookmarks/update_bookmark_card", locals: { recipe_id: @recipe.id } }
      end
    else
    redirect_to bookmarks_path
    end
  end

  private

  # def bookmark_params
  #   params.require(:bookmark).permit(:recipe_id)
  # end
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
