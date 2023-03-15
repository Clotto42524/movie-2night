class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :accepted, inclusion: { in: %w(Pending Accepted Declined) }
  validates :user, presence: true
end
