class Movie < ApplicationRecord
  has_many :movies

  validates :title, :overview, :release_date, :genre, :poster_path, :vote_average, presence: true
end
