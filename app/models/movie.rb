class Movie < ApplicationRecord
  has_many :selected_movies

  # validates :title, :overview, :release_date, :genre, :poster_path, :vote_average, presence: true
end
