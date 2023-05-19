class MoviesController < ApplicationController
  def index
    @movies = Movie.all
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
    if @movie.save
      redirect_to @movie, notice: "Movie updated successfully"
    else
      flash[:notice] = "Movie failed to update"
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new()
  end

  def create
    @movie = Movie.create(permitted_params)
    if @movie.save
      redirect_to @movie
    else
      flash[:notice] = "Failed to create movie"
      render :new, status: :unprocessable_entity
    end
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

end
