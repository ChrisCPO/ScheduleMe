class DashboardsController < ApplicationController
  def show
    @locations = my_locations
  end

  private

  def my_locations
    current_user.locations
  end
end
