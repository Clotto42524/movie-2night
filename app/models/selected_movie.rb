class SelectedMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :event
end
