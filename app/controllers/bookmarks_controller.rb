class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create, :destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
  end

  def destroy
  end

  private
  def bm_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
