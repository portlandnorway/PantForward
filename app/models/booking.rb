class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  validate :booking_limit, on: :create

  enum status: [:booked, :picked_up, :confirmed]

  BOOKING_LIMIT = 5

  def booking_limit
    if user.bookings.booked.count >= BOOKING_LIMIT
      errors.add(:base, 'Exceeded bookings limit! Complete a pick-up to continue.')
    end
  end

end

