class User < ActiveRecord::Base
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  # include DeviseTokenAuth::Concerns::User
  has_many :doctors, dependent: :destroy
  has_many :appointments, dependent: :destroy
  validates :username, :email, presence: true

  def jwt_payload
    super
  end
end
