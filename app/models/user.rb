class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  belongs_to :location

  def self.new_password
    { password: SecureRandom.hex(8) }
  end
end
