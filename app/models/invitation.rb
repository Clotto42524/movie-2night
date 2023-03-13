class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :accepted, inclusion: { in: %w(Pending Accepted Declined) }
end
