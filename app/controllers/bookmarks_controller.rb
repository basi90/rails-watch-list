class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create, :destroy]
  before_action :set_bm, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.new(bm_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private
  def bm_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bm
    @bookmark = Bookmark.find(params[:id])
  end
end
