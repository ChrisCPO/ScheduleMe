class Shift < ActiveRecord::Base
  validates :shift_date, presence: true
  validates :shift_time, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
