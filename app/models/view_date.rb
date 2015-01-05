class ViewDate
  include ActiveModel::Model

  attr_reader :date, :range_of_dates, :params

  def initialize(params = String.new)
    @params = params
    params_there?
  end

  private

  def date_now
    DateTime.now.all_week
  end

  def new_range_of_dates
    convert_date(date.gsub(/\D/, "/")).all_week
  end

  def convert_date(day)
    DateTime.strptime(day, "%m/%d/%y")
  end

  def params_there?
    if params == (nil || String.new)
      @range_of_dates = date_now
    else
      valid?
    end
  end

  def valid?
    @date = params[:dates][:date]
    if (length_ok? && has_periods?)
      @range_of_dates = new_range_of_dates
    else
      @range_of_dates = date_now
    end
  end

  def length_ok?
    date.length == 8
  end

  def has_periods?
    (date[2] == "." && date[5] == ".")
  end
end
