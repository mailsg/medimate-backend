class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, :confirmable
  include DeviseTokenAuth::Concerns::User
  has_many :doctors
  has_many :appointments
  validates :username, :email, presence: true
end
