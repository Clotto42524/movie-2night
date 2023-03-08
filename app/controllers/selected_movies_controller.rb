class SelectedMoviesController < ApplicationController

  def index
    @selected_movies = SelectedMovie.all
  end

  def show
    @event = Event.find(params[:event_id])
    @selected_movie = SelectedMovie.find(params[:id])
  end

  def create
    # @event = Event.find(params[:event_id])
    # @movie = Movie.where(movie: movie.tmdb_id == #id from API response)
    # SelectedMovie.create(movie: @movie, event: @event)
  end

  def update
    @movie = SelectedMovie.find(params[:id])
    @movie.vote_count += 1
    @movie.save!
    redirect_to event_selected_movie_path
  end
end
