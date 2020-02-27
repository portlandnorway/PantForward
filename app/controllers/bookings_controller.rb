class BookingsController < ApplicationController
  before_action :find_booking, except: :create

  def create
    @booking = current_user.bookings.new(collection_id: params[:collection_id])
    @booking.save
    redirect_to booking_path(@booking)
  end

  def show
  end

  def picked_up
    @booking.picked_up!
    @booking.save
    dashboard
  end

  def confirmed
    @booking.confirmed!
    @booking.save
    dashboard
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def dashboard
    redirect_to dashboard_path
  end
end
