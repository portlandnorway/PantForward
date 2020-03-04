class BookingsController < ApplicationController
  before_action :find_booking, except: :create

  def create
    @collection = Collection.find(params[:collection_id])
    @booking = current_user.bookings.new(collection: @collection)
    @booking.save
    broadcast_booked
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

    redirect_to dashboard_path(tab: 'collections')
  end

  def confirmed
    @booking.confirmed!
    @booking.save
    broadcast_confirmed
    redirect_to dashboard_path(tab: 'statistics')
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def broadcast_pick_up
    ActionCable.server.broadcast("user_channel_#{@booking.collection.user_id}", {
      content: "Your collection was picked up by #{@booking.user.first_name}",
      link: dashboard_path(tab: 'donations')
    })
  end

  def broadcast_confirmed
    ActionCable.server.broadcast("user_channel_#{@booking.user_id}", {
      content: "Confirmed! #{@booking.collection.user.first_name} confirmed your pick-up.",
      link: dashboard_path(tab: 'statistics')
    })
  end

  def broadcast_booked
    ActionCable.server.broadcast("user_channel_#{@booking.collection.user_id}", {
      content: "On their way! Your donation will be picked up by #{@booking.user.first_name}.",
      link: dashboard_path(tab: 'donations')
    })
  end
end
