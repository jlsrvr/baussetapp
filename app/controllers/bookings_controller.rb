class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    # @beds = Bed.all
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = current_user.booking.build(booking_params)
    # we need `restaurant_id` to asssociate booking with corresponding restaurant
    @booking.save
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:content)
  end
end
