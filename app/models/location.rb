class Location < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user

  has_many :user_location_relationships

  has_many :users, through: :user_location_relationships
end
