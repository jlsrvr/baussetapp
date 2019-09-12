class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @locations = policy_scope(Location)
  end

  def show
    @location = Location.find(params[:id])
    authorize @location
    events = @location.bookings.where(status: "accepted")
    @upcoming_bookings = events.where('start_date >= ?', Date.current).order(start_date: :asc).first(5)
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
