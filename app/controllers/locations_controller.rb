class LocationsController < ApplicationController
  before_action :user_has_no_location, only: [:create, :new]
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.add_user(current_user)

    if @location.save
      current_user.make_user_owner!
      redirect_to @location
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
    @location ||= Location.find(params[:id])
  end
end
