class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  validate :booking_limit, on: :create

  enum status: [:booked, :picked_up, :confirmed]

  BOOKING_LIMIT = 10

  def booking_limit
    if user.bookings.booked.count >= BOOKING_LIMIT
      errors.add(:base, 'Exceeded bookings limit! Complete a pick-up to continue.')
    end
  end

  def total_bottles
    collection.big_bottles + collection.small_bottles
  end

  def reward_calculation_booking
    (collection.big_bottles * 3) + (collection.small_bottles * 2) + collection.tip
  end
end

