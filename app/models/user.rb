class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, presence: true

  has_one :password_reset

  belongs_to :location

  enum role: [ :unassigned,
               :manager,
               :floor_manager,
               :bar,
               :kitchen,
               :server,
               :server_assistent
             ]

  def self.new_password
    { password: SecureRandom.hex(8) }
  end

  def make_user_owner!
    update(:role, 1)
    self.owner = true
  end

  def location?
    location
  end

  def role_value
    User.roles.to_h.values_at(role.to_s).first.to_i
  end
end
