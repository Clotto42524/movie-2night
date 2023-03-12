class Event < ApplicationRecord
  belongs_to :user
  has_many :selected_movies, dependent: :destroy
  has_many :invitations, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :name, :address, :date, presence: true
end
