class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :appointment_date, :appointment_time, :duration, :user_id, :doctor_id, presence: true
end
