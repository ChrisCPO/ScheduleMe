class Shift < ActiveRecord::Base
  validates :shift_date, presence: true
  validates :shift_time, presence: true
  validates :user_id, presence: true

  belongs_to :schedule
  belongs_to :user

  belongs_to :location
end
