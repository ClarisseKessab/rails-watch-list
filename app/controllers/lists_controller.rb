class ListsController < ApplicationController
  def home

  end
  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    @list.save

    redirect_to list_path(@list)
  end

  def show
    @list = List.find(params[:id])
    @movie = @list.movies
  end

  def update
    @list = List.find(params[:id])
    @list = update(params_list)

    redirect_to lists_path
  end

  def edit
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  private

  def params_list
    params.require(:list).permit(:name)
  end
end
