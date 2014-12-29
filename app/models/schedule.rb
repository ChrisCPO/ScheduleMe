class Schedule
  include ActiveModel::Model

  attr_accessor :shifts
  attr_accessor :dates
  attr_reader :user

  def initialize(user, attributes, dates = nil)
    @user = user
    @dates = dates
    super(attributes)
  end

  def shifts_attributes=(attributes)
    @shifts ||= []
    attributes.each do |index, attrs|
      shift = Shift.new(attrs.merge(user: user, shift_date: dates[index.to_i]))

      if shift.valid?
        @shifts << shift
      end
    end
  end

  def week_days
    start_of_week.all_week.to_a
  end

  def start_of_week
    DateTime.now.beginning_of_week
  end

  def end_of_week
    DateTime.now.end_of_week
  end

  def user=(new_user)
    @user = new_user
  end

  def save
    @shifts.each(&:save)
  end
end
