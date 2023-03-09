require "json"
require "open-uri"

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
    api_key = "78cfc3b30f14c15708feec27e5766e25"
    # genre_id's to be string generated from array.join(",")
    # release_years to be string generated from array.join(",")
    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{api_key}&sort_by=popularity.desc&with_genres=#{genre_ids}&primary_release_year=#{release_years}&with_original_language=en"
    movies_serialized = URI.open(url).read
    movies = JSON.parse(movies_serialized)
    movies_array = movies["results"]
    movies_array.each do |movie|
      SelectedMovie.create(title: movie["title"], overview: movie["overview"], release_date: movie["release_date"], poster_path: movie["poster_path"], event: Event.first)
    end
  end

  def update
    @movie = SelectedMovie.find(params[:id])
    @movie.vote_count += 1
    @movie.save!
    redirect_to event_selected_movie_path
  end
end
