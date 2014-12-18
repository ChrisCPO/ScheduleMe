class NullShift
  attr_reader :shift_date

  def initialize(attributes)
    @shift_date = attributes[:shift_date]
  end

  def shift_time
    "-"
  end

  def notes
    "-"
  end

  def date_words_format
    self.shift_date.strftime("%a, %b %e %y")
  end
end
