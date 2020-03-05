class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  enum status: [:booked, :picked_up, :confirmed]

  def total_bottles
    collection.big_bottles + collection.small_bottles
  end

  def reward_calculation_booking
    (collection.big_bottles * 3) + (collection.small_bottles * 2) + collection.tip
  end
end

