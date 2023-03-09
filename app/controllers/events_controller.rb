require "json"
require "open-uri"

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @selected_movies = SelectedMovie.where(event: @event)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  def set_genre
    api_key = "78cfc3b30f14c15708feec27e5766e25"
    url = "https://api.themoviedb.org/3/genre/movie/list?api_key=#{api_key}&language=en-US"
    genres_serialized = URI.open(url).read
    genres = JSON.parse(genres_serialized)
    genres_hash = genres["genres"]
    @genres = genres_hash.map do |genre|
      genre["name"]
    end
  end

  def set_decade
    raise 
    session[:genres] = params[:genre_ids]
    @event = Event.find(params[:id])

    release_years = {
      "2020s" => [2020..2023],
      "2010s" => [2010..2019],
      "2000s" => [2000..2009],
      "1990s" => [1990..1999],
      "1980s" => [1980..1989],
      "1970s" => [1970..1979],
      "1960s" => [1960..1969],
      "1950s" => [1950..1959],
      "sub_1950s" => [1890..1949]
    }

    @decades = release_years.keys
  end

  def users
    @users = User.all
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :address)
  end
end
