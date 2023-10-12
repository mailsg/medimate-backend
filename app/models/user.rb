class User < ActiveRecord::Base
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  
  has_many :doctors, dependent: :destroy
  has_many :appointments, dependent: :destroy
  validates :username, :email, presence: true

  # rubocop:disable Lint/UselessMethodDefinition
  def jwt_payload
    # This method is required by Devise to generate JWT tokens.
    # It includes user-specific data in the token payload.
    super
    # Add any additional user data you want to include in the JWT payload
  end
  # rubocop:enable Lint/UselessMethodDefinition
end
