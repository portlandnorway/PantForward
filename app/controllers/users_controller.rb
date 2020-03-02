class UsersController < ApplicationController
  def dashboard
    # query to find user's donations through bookings, stored in an array '@history'
    @history = current_user.collections.flat_map { |collection| collection.bookings.confirmed }

    # query to find user's pick-ups through bookings, stored in an array '@pick_ups'
    @pick_ups = current_user.bookings.confirmed
    # Booking.confirmed.all.where(user: @booking.user)

    @stats = OpenStruct.new({
      # collection stats
      pick_ups: @pick_ups.count, # returns # of pick-ups completed
      bottles_picked_up: @pick_ups.sum(&:total_bottles), # returns # of bottles picked_up
      money_earned: @pick_ups.sum(&:reward_calculation_booking),
      # donation stats
      donations: @history.count, # returns # of donations completed
      bottles_donated: @history.sum(&:total_bottles), # returns # of bottles donated
      money_donated: @history.sum(&:reward_calculation_booking)
    })

  end

  def learn
  end
end
