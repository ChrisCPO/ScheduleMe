class SchedulesController < ApplicationController
  def show
    @shifts = []
    location = Location.find(params[:location_id])
    location.users.each do |user|
      @shifts << Array(user_shifts(user))
    end
  end

  private

  def shift_dates
    DateTime.now.beginning_of_week.all_week
  end

  def user_shifts(user)
    shift_dates.map do |shift_date|
      shifts(user).detect { |shift| shift.shift_date == shift_date.to_date } ||
    NullShift.new(shift_date: shift_date, user: user)
    end
  end

  def shifts(user)
    Shift.where(shift_date: shift_dates).where(user_id: user)
  end
end
