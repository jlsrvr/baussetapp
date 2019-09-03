class BookingsController < ApplicationController
  before_action :set_location, only: %i[new create]
  before_action :set_booking, except: %i[index new create]
    # only: %i[edit update choose_beds add_beds destroy deny]
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
    @location = @booking.location
  end

  def update
    if @booking.update(booking_params)
      if !current_user.admin
        @booking.mark_as("pending")
        @booking.save!
      end
      redirect_to bookings_path
    else
      render :edit
    end
  end

  def choose_beds
    # faire de ca une modal
  end

  def add_beds
    # pourquoi est ce que d'habitude je dois passer par une methode privé alors que la ca marche seul, ou comment faire pour passer par une méthode privée?
    # Get the bed instances from the ids in the params
    beds = params[:booking][:bed_ids][:ids]
    beds.each do |id|
      # For each bed create a combination with the booking
      Combination.create!(
        bed: Bed.find(id),
        booking: @booking
      )
    end
    # if all combinations have been saved accept status of booking
    @booking.mark_as("accepted")
    if @booking.save
      # mettre un pop-up pour dire que ca a été successfull
      redirect_to bookings_path
    else
      raise
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def decline
    @booking.mark_as("declined")
    if @booking.save
      @booking.combinations.destroy_all
      render :edit
    end
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
