class BookingsController < ApplicationController
  before_action :set_location, only: %i[new create]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @places = @location.no_of_places
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = current_user.bookings.build(booking_params.merge(location: @location))
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    @location = @booking.location
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit
    end
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :place, :message)
  end
end
