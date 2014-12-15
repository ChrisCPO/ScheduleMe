class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, presence: true
  validates_with OwnerValidator

  has_one :password_reset

  belongs_to :location

  delegate :name, to: :location, prefix: true, allow_nil: true

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

  def manager_and_owner?
    manager? && owner?
  end

  def location?
    location
  end

  def role_value
    User.roles[role]
  end

  def formatted_name
    username.capitalize
  end

  def formatted_role
    role.capitalize
  end
end
