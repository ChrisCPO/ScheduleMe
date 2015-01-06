class TimetablesController < ApplicationController
  def new
    @schedules = []
    location = Location.find(params[:location_id])

    location.users.each do |user|
      shifts = Array.new(7) {user.shifts.new(user: user)}
      @schedules << Schedule.new(user, shifts: shifts)
    end
  end

  def create
    raise params
    @schedules = []
    shifts = Array.new(7) {Shift.new}
    location = Location.find(params[:location_id])

    location.users.each do |user|
      @schedules << Schedule.new(user, shifts: shifts)
    end
  end
end
