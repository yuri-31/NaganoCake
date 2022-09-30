class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genres = Genre.all.order(created_at: :desc)
  end
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  
  private
  def genre_params
    params.permit(:name)
  end
  
end
