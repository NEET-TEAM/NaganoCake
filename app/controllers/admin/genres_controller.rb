class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genres_params)
    genre.save
    redirect_to genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genres_params)
      redirect_to genres_path
    else
      render :edit
    end
  end
  
  private
  
  def genres_params
    params.require(:genre).permit(:name)
  end
  
end
