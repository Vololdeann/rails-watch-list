class ListsController < ApplicationController

  before_action :set_list, only: %i[ show edit update destroy ]

  def index
    @lists = List.all
  end


  def new
    @list = List.new
  end

  def edit
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list: @list)
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

def update
  if @list.update(list_params)
    redirect_to @list, notice: "List was successfully updated."
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @list.destroy
  redirect_to lists_url, notice: "List was successfully destroyed."
end

private

def set_list
  @list = List.find(params[:id])
end

def list_params
  params.require(:list).permit(:name)
end
end
