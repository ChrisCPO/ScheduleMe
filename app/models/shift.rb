class Shift < ActiveRecord::Base
  validates :shift_date, presence: true
  validates :shift_time, presence: true
  validates :user_id, presence: true

  belongs_to :schedule
  belongs_to :user

  belongs_to :location

  def date_words_format
    shift_date.strftime("%a, %b %e %y")
  end
end
