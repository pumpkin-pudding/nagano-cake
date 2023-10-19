class Admin::GenresController < ApplicationController

def index
  @genres = Genre.all
end

def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to '/admin/genres'
end

def edit
  @genres = Genre.all
  @genre = Genre.find(params[:id])
end

def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genre_path(genre.id)
end

private
    def genre_params
    params.require(:genre).permit(:name)
end

end
