class Event < ApplicationRecord
  belongs_to :user
  has_many :selected_movies
  has_many :invitations, dependent: :destroy

  # validates :name, :address, :date, presence: true
end
