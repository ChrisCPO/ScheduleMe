class NullShift
  attr_reader :shift_date, :user

  NA = "NA"

  def initialize(attributes)
    @shift_date = attributes[:shift_date]
    @user = attributes[:user] ||= NA
  end

  def shift_time
    "-"
  end

  def notes
    "-"
  end

  def date_words_format
    shift_date.strftime("%a, %b %e %y")
  end
end
