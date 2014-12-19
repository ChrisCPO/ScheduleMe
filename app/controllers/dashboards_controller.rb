class DashboardsController < ApplicationController
  def show
    @schedule = user_shifts
  end

  private

  def shift_dates
    DateTime.now.beginning_of_week.all_week
  end

  def user_shifts
    shift_dates.map do |shift_date|
      shifts.detect { |shift| shift.shift_date == shift_date.to_date } ||
    NullShift.new(shift_date: shift_date)
    end
  end

  def shifts
    Shift.where(shift_date: shift_dates)
  end
end
