class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  enum status: [:booked, :picked_up, :confirmed]
end
