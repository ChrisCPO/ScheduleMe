class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, presence: true

  has_one :password_reset

  belongs_to :location

  enum role: {employee: 0,manager: 1}

  def self.new_password
    { password: SecureRandom.hex(8) }
  end

  def set_manager
    self.role = 1
  end

  def make_user_owner
    set_manager
    self.toggle(:owner)
  end
end
