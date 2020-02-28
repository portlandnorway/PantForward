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
        image_url: helpers.asset_url('bottle')
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
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def dashboard
    redirect_to dashboard_path
  end
end
