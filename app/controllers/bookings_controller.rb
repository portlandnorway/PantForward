class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.collection_id = params[:collection_id]
    @booking.save
    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def picked_up
    @booking = Booking.find(params[:id])
    @booking.status = 1
    @booking.save!
    redirect_to dashboard_path
  end

end
