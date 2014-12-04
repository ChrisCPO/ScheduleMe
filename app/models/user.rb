class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :user_location_relationships
  has_many :locations, through: :user_location_relationships
end
