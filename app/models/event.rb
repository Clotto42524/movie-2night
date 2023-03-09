class Event < ApplicationRecord
  belongs_to :user
  has_many :selected_movies, dependent: :destroy
  has_many :invitations, dependent: :destroy

  # validates :name, :address, :date, presence: true
end
