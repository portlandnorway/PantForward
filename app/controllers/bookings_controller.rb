class BookingsController < ApplicationController
  before_action :find_booking, except: :create

  # AJAX request!
  def create
    @collection = Collection.find(params[:collection_id])
    @booking = current_user.bookings.new(collection: @collection)
    @booking.save
  end

  def show
    @markers =
      [{
        lat: @booking.collection.latitude,
        lng: @booking.collection.longitude,
        infoWindow: render_to_string(partial: "collections/info_window", locals: { collection: @booking.collection }),
        image_url: helpers.asset_url('cropped-logo-black')
      }]
  end

  def picked_up
    @booking.picked_up!
    @booking.save
    dashboard
  end

  def confirmed
    @booking.confirmed!
    @booking.save

    find_donator_history # query to find user's donations through bookings, stored in an array '@history'
    find_collector_history # query to find user's pick-ups through bookings, stored in an array '@pick_ups'

    pick_ups_total(@pick_ups) # returns # of pick-ups completed
    bottles_picked_up_total(@pick_ups) # returns # of bottles picked_up
    donations_total(@history) # returns # of donations completed
    bottles_donated_total(@history) # returns # of bottles donated

    redirect_to dashboard_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_donator_history
    donations_array = []
    current_user.collections.each { |collection| donations_array  << collection.bookings.confirmed }
    @history = donations_array.flatten # an array of donations through bookings that have been confirmed and completed.
  end

  def find_collector_history
    @pick_ups = Booking.confirmed.all.where(user: @booking.user)
  end

  def donations_total(donations)
    # donations = array of a user's completed donations (through bookings)
    donations.count
  end

  def pick_ups_total(pick_ups)
    # pick_ups = array of a user's completed pick-ups (through bookings)
    pick_ups.count
  end

  def bottles_donated_total(donations)
    # donations = array of a user's completed donations (through bookings)
    sum = 0
    donations.each do |d|
      sum += d.collection.big_bottles
      sum += d.collection.small_bottles
    end
    sum
  end

  def bottles_picked_up_total(pick_ups)
    # pick_ups = array of a user's completed pick-ups (through bookings)
    sum = 0
    pick_ups.each do |pick_up|
      sum += pick_up.collection.big_bottles
      sum += pick_up.collection.small_bottles
    end
    sum
  end

  def dashboard
    redirect_to dashboard_path
  end
end
