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
    # redirect_to recipe_path(@recipe)
    respond_to do |format|
      format.js { render partial: "bookmarks/update_bookmark_card" }
    end
  end

  def destroy
    @bookmark.destroy
    # redirect_to bookmarks_path
    respond_to do |format|
      format.js { render partial: "bookmarks/update_bookmark_card" }
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
