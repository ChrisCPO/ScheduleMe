class SchedulesController < ApplicationController
  def show
    @shifts = []
    @dates = ViewDate.new
    @shifts = create_shifts
  end

  def create
    @shifts = []
    @dates = ViewDate.new(params)
    @shifts = create_shifts

    render :show
  end

  private

  def create_shifts
    shifts = []
    location.users.each do |user|
      shifts << Array(user_shifts(user))
    end
    shifts
  end

  def location
    Location.find(params[:location_id])
  end

  def user_shifts(user)
    @dates.range_of_dates.map do |shift_date|
      shifts(user).detect { |shift| shift.shift_date == shift_date.to_date } ||
    NullShift.new(shift_date: shift_date, user: user)
    end
  end

  def shifts(user)
    Shift.where(shift_date: @dates.range_of_dates).where(user_id: user)
  end
end
