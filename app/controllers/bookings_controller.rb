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
        image_url: helpers.asset_url('cropped-logo-black')
      }]
  end

  def picked_up
    @booking.picked_up!
    @booking.save
    redirect_to dashboard_path
  end

  def confirmed
    @booking.confirmed!
    @booking.save
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

end
