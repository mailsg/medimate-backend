class Doctor < ApplicationRecord
  belongs_to :specialization
  validates :name, :bio, :fee_per_appointment, :specialization_id, :bio, :time_available_from, :time_available_to,
            presence: true
end
