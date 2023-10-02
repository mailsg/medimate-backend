class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  # include DeviseTokenAuth::Concerns::User
  has_many :doctors, dependent: :destroy
  has_many :appointments, dependent: :destroy
  validates :username, :email, presence: true
end
