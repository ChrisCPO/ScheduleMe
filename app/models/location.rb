class Location < ActiveRecord::Base
  validates :name, presence: true

  has_one :owner
  has_one :schedule

  has_many :users
  has_many :shifts, through: :schedules

  def add_user(user)
    users << user
  end
end
