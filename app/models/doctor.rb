class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :specialization
  has_many :appointments, dependent: :destroy
  validates :name, :bio, :fee_per_appointment, :specialization_id, :bio, :time_available_from, :time_available_to,
            presence: true
end
