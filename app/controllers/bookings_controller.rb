class BookingsController < ApplicationController
  before_action :set_location, only: %i[new create]
  before_action :set_booking, only: %i[edit update choose_beds add_beds]

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
    authorize @booking
    @location = @booking.location
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit
    end
  end

  def add_beds
    raise
    # Get the bed instances from the ids in the params
    # For each bed create a combination with the booking
    # if all combinations have been saved accept status of booking
    # redirect_to bookings_path
  end

  def choose_beds
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :place, :message, :bed_ids)
  end
end
