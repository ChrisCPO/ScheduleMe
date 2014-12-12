class Location < ActiveRecord::Base
  validates :name, presence: true
  has_one :owner
  has_many :users

  def add_user(user)
    users << user
  end
end
