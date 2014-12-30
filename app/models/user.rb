class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :role, presence: true
  validates_with OwnerValidator, unless: :setting_owner?

  has_one :password_reset

  has_many :shifts

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
    @setting_owner = true
    self.owner = true
    self.role = 1
    save
  end

  def location?
    if location == nil || false
      false
    else
      true
    end
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

  private

  attr_accessor :setting_owner

  def setting_owner?
    @setting_owner ||= false
  end
end
