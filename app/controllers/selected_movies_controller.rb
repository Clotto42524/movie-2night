class SelectedMoviesController < ApplicationController

  def index
    @selected_movies = SelectedMovie.all
  end

  def show
    @event = Event.find(params[:event_id])
    @selected_movie = SelectedMovie.find(params[:id])
  end

  def create

    @event = Event.find(params[:id])

    genres_hash = {"Action" => 28, "Adventure" => 12, "Animation" => 16, "Comedy" => 35, "Crime" => 80, "Documentary" => 99, "Drama" => 18, "Family" => 10751, "Fantasy" => 14, "History" => 36, "Horror" => 27, "Music" => 10402, "Mystery" => 9648, "Romance" => 10749, "Science Fiction" => 878, "Thriller" => 53, "War" => 10752, "Western" => 37 }
    genres_array = session[:genres]
    genre_ids = genres_array.map do |genre|
      genres_hash[genre]
    end
    genre_ids_string = genre_ids.join(",")

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

    decades_array = ["1990s", "2000s"]
    years = decades_array.map do |decade|
      release_years[decade]
    end
    decades_string = years.flatten.join(",")

    api_key = "78cfc3b30f14c15708feec27e5766e25"
    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{api_key}&sort_by=popularity.desc&with_genres=#{genre_ids_string}&primary_release_year=#{decades_string}&with_original_language=en"
    movies_serialized = URI.open(url).read
    movies = JSON.parse(movies_serialized)
    movies_array = movies["results"]
    movies_array.each do |movie|
      SelectedMovie.new(title: movie["title"], overview: movie["overview"], release_date: movie["release_date"], poster_path: movie["poster_path"], event: @event).save!
    end
    redirect_to event_path(@event)
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
