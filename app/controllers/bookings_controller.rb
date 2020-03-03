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

    broadcast_pick_up

    redirect_to dashboard_path
  end

  def confirmed
    @booking.confirmed!
    @booking.save

    broadcast_confirmed
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def broadcast_pick_up
    ActionCable.server.broadcast("user_channel_#{@booking.collection.user_id}", {
      content: "Your collection was picked up by #{@booking.user.first_name}",
      link: dashboard_path(anchor: 'donations')
    })
  end

  def broadcast_confirmed
    ActionCable.server.broadcast("user_channel_#{@booking.collection.user_id}", {
      content: "Your collection was picked up by #{@booking.user.first_name}",
      link: dashboard_path(anchor: 'donations')
    })
  end
end
