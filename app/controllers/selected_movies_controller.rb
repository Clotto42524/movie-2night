require "json"
require "open-uri"

class SelectedMoviesController < ApplicationController
  before_action :set_event, only: [:index, :show, :top]
  before_action :set_movie, only: [:show, :update]

  def index
    @selected_movies = SelectedMovie.where(event: @event)
  end

  def show
  end

  def create
    set_genres
    set_decades
    set_movies
    @limited_array.each do |movie|
      SelectedMovie.create(title: movie["title"], overview: movie["overview"], release_date: movie["release_date"], poster_path: movie["poster_path"], event: @event)
    end

    redirect_to event_selected_movies_path(@event)
  end

  def update
    @selected_movie.vote_count += 1
    @selected_movie.save!
  end

  def top
    voted_movies = @event.selected_movies.select { |movie| movie.vote_count.positive? }
    @sorted_movies = voted_movies.sort_by { |h| -h[:vote_count] }
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_movie
    @selected_movie = SelectedMovie.find(params[:id])
  end

  def set_genres
    @event = Event.find(params[:id])
    @event.selected_movies.destroy_all
    genres_hash = {"Action" => 28, "Adventure" => 12, "Animation" => 16, "Comedy" => 35, "Crime" => 80, "Documentary" => 99, "Drama" => 18, "Family" => 10751, "Fantasy" => 14, "History" => 36, "Horror" => 27, "Music" => 10402, "Mystery" => 9648, "Romance" => 10749, "Science Fiction" => 878, "Thriller" => 53, "War" => 10752, "Western" => 37 }
    genres_array = session[:genres]
    if genres_array.nil?
      @genre_ids_string = genres_hash.keys.join(",")
    else
      genre_ids = genres_array.map do |genre|
        genres_hash[genre]
      end
      @genre_ids_string = genre_ids.join(",")
    end
  end

  def set_decades
    release_years = {
      "2020s" => (2020..2023).to_a,
      "2010s" => (2010..2019).to_a,
      "2000s" => (2000..2009).to_a,
      "1990s" => (1990..1999).to_a,
      "1980s" => (1980..1989).to_a,
      "1970s" => (1970..1979).to_a,
      "1960s" => (1960..1969).to_a,
      "1950s" => (1950..1959).to_a,
      "sub_1950s" => (1940..1949).to_a
    }
    decades_array = params["decades"]
    if decades_array.nil?
      @decades_string = "2020,2021,2022,2023"
    else
      years = decades_array.map do |decade|
        release_years[decade]
      end
      @decades_string = years.flatten.join(",")
    end
  end

  def set_movies
    api_key = "78cfc3b30f14c15708feec27e5766e25"
    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{api_key}&sort_by=popularity.desc&with_genres=#{@genre_ids_string}&primary_release_year=#{@decades_string}&with_original_language=en"
    movies_serialized = URI.open(url).read
    movies = JSON.parse(movies_serialized)
    @movies_array = movies["results"]
    @limited_array = @movies_array.reject {|item| @movies_array.index(item) > 8 }
  end
end
