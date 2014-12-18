class Shift < ActiveRecord::Base
  validates :user_id, presence: true
  validates :shift_date, presence: true
  validates :shift_time, presence: true

  belongs_to :user
  belongs_to :schedule

  belongs_to :location

  def date_words_format
    self.shift_date.strftime("%a, %b %e %y")
  end
end
