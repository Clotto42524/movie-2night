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
    @genres = []
    genres_hash = genres["genres"]
    genres_hash.map do |genre|
      genre["name"]
    end
  end

  def set_decade
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
