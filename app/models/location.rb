class Location < ActiveRecord::Base
  validates :name, presence: true
  has_one :owner
  has_many :users


  def location_name
    name
  end

  def add_user(user)
    users << user
  end
end
