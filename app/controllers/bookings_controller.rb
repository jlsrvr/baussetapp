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
    @booking = current_user.bookings.build(booking_params)
    authorize @booking
    @booking.save
    if @booking.save
      redirect_to booking_path(@booking)
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
    params.require(:booking).permit(:start_date, :end_date, :bed_id)
  end
end
