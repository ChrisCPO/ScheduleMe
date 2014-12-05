class Location < ActiveRecord::Base
  validates :name, presence: true

  has_many :users

  def add_user(user)
    users << user
  end
end
