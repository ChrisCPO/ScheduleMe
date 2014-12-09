class User < ActiveRecord::Base
  enum role: {manager: 0, employee: 1}

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, presence: true

  has_one :password_reset

  belongs_to :location

  ROLE = ["employee", "manager"].to_enum

  def self.new_password
    { password: SecureRandom.hex(8) }
  end

  def default_role
    ROLE.first
  end

  def set_manager
    role =  ROLE.
  end

  def make_user_owner
    set_manager
    toggle(:owner)
  end
end
