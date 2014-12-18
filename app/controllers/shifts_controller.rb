class ShiftsController < ApplicationController
  def new
    user = User.find(params[:user_id])
    shifts = Array.new(7) { user.shifts.new }
    @schedule = Schedule.new(user, shifts: shifts)
  end

  def create
    @schedule = Schedule.new(find_user, schedule_params, week_dates)
    @schedule.save

    redirect_to location_users_path(current_user.location)
  end

  private

  def week_dates
    DateTime.now.all_week.to_a
  end

  def schedule_params
    params.require(:schedule).
      permit(shifts_attributes: [:notes, :shift_date, :shift_time, :user_id])
  end

  def find_user
    User.find(params[:user_id])
  end
end
