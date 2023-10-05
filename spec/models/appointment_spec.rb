require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validation tests' do
    subject do
      @user1 = User.new(username: 'Lorem Ipsum', email: 'lorem@ipsum.com', password: '123456',
                        password_confirmation: '123456')
      @doctor1 = Doctor.new(name: 'Dr. Dolittle', location: 'USA', specialization_id: 10, fee_per_appointment: 400,
                            bio: '10 Years of experience', time_available_from: '08:00:00', time_available_to: '20:00:00')
      Appointment.new(user_id: @user1.id, doctor_id: @doctor1.id, appointment_date: '27-01-2023',
                      appointment_time: '12:40:00', duration: '30')
    end

    before { subject.save }

    it 'Appointment date should be present' do
      subject.appointment_date = nil
      expect(subject).to_not be_valid
    end

    it 'Appointment time should be present' do
      subject.appointment_time = nil
      expect(subject).to_not be_valid
    end

    it 'Appointment duration should be present' do
      subject.duration = nil
      expect(subject).to_not be_valid
    end

    it 'user_id should be present' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'doctor_id should be present' do
      subject.doctor_id = nil
      expect(subject).to_not be_valid
    end
  end
end
