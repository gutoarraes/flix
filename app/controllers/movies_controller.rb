class MoviesController < ApplicationController
  def index
    @movies = released_at
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(permitted_params)
    redirect_to @movie
  end

  def new
    @movie = Movie.new()
  end

  def create
    @movie = Movie.create(permitted_params)
    redirect_to @movie, notice: "Movie created successfully"
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, status: :see_other,
      alert: "Movie successfully deleted!"
  end

  private

  def permitted_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :director, :duration, :image_file_name)
  end

  def released_at
    Movie.where('released_on < ?',Time.now).order(released_on: :desc)
  end
end
