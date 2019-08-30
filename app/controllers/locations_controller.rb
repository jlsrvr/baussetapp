class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @locations = policy_scope(Location)
  end

  def show
    @location = Location.find(params[:id])
    authorize @location
    events = @location.bookings.where(status: "accepted")
    @events = events.map do |booking|
      {
        title: booking.user.first_name,
        start: booking.start_date,
        end: booking.end_date,
        allDay: true
      }
    end
  end
end
