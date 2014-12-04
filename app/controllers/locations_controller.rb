class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    location = current_user.locations.build(location_params)
    location.users << current_user

    if location.save
      redirect_to location_path(location)
    else
      render :new
    end
  end

  def show
    @location = find_location
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end

  def find_location
    Location.find(params[:id])
  end
end
