class DashboardsController < ApplicationController
  def show
    @location = my_location
  end

  private

  def my_location
    current_user.location
  end
end
