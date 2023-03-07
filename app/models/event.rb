class Event < ApplicationRecord
  belongs_to :user
  has_many :selected_movies

  validates :name, :address, :date, presence: true
end
