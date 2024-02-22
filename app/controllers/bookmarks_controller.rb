class BookmarksController < ApplicationController

  before_action :set_bookmark, only: %i[ show edit update destroy ]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@bookmark.list), notice: "Bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: "Bookmark was successfully destroyed."
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
