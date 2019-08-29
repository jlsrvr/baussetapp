class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @location = Location.find(params[:location_id])
    @places = @location.no_of_places
    @booking = Booking.new
    authorize @booking
  end

  def create
    @location = Location.find(params[:location_id])
    @booking = current_user.bookings.build(booking_params.merge(location: @location))
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :place)
  end
end
