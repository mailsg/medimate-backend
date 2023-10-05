require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validation tests' do
    subject do
      @user1 = User.new(username: 'Lorem Ipsum', email: 'lorem@ipsum.com', password: '123456', password_confirmation: '123456')
      Doctor.new(name: 'Dr. Dolittle', location: 'USA', specialization_id: 10, fee_per_appointment: 400,
                bio: '10 Years of experience', time_available_from: '08:00:00', time_available_to: '20:00:00')
    end
    before { subject.save }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end

    it 'should declare a specialization' do
      subject.specialization_id = nil
      expect(subject).to_not be_valid
    end

    it 'should have a rate greater than 0' do
      subject.fee_per_appointment = -100
      expect(subject).to_not be_valid
    end

    it 'should have a bio setup' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'should have a time_available_from' do
      subject.time_available_from = nil
      expect(subject).to_not be_valid
    end

    it 'should have a time_available_to' do
      subject.time_available_to = nil
      expect(subject).to_not be_valid
    end
  end
end