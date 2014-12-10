class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, presence: true

  has_one :password_reset

  belongs_to :location

  enum role: { unassigned: 0,
               manager: 1,
               floor_manager: 2,
               kitchen: 3,
               server: 4,
               server_assistent: 5,
               bar: 6
  }

  def self.new_password
    { password: SecureRandom.hex(8) }
  end

  def set_manager
    self.role = 1
  end

  def make_user_owner
    set_manager
    toggle(:owner)
  end

  def location?
    location
  end
end
