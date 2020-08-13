class BookmarksController < ApplicationController
  before_action :set_recipe, only: [:create, :destroy]
  def create
    bookmark = current_user.bookmarks.build(recipe_id: params[:recipe_id])
    bookmark.save
  end

  def destroy
    current_user.bookmarks.find_by(recipe_id: params[:recipe_id]).destroy
  end
  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
