class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @locations = policy_scope(Location)
    authorize @locations
  end
end
