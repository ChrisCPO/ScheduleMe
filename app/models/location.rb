class Location < ActiveRecord::Base
  validates :name, presence: true

  has_one :schedule

  has_many :shifts, through: :schedules
  has_many :users

  def add_user(user)
    users << user
  end
end
