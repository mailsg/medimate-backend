require 'faker'

User.destroy_all
Doctor.destroy_all
Appointment.destroy_all
Specialization.destroy_all

users = Array.new(10) do
  {
    username: Faker::Internet.unique.username,
    email: Faker::Internet.unique.email,
    password: '123456',
  }
end

User.create!(users)

specializations = [
  { name: 'Cardiology' },
  { name: 'Dermatology' },
  { name: 'Orthopedics' },
]

Specialization.create!(specializations)

# Seed Doctors
doctors = Array.new(10) do
  {
    name: Faker::Name.name,
    time_available_from: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    time_available_to: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
    bio: Faker::Lorem.paragraph,
    fee_per_appointment: Faker::Number.decimal(l_digits: 2),
    specialization: Specialization.all.sample,
    image: Faker::LoremFlickr.image,
    user: User.all.sample
  }
end

Doctor.create!(doctors)

appointments = Array.new(10) do
  {
    appointment_date: Faker::Date.forward(days: 30),
    appointment_time: Faker::Time.forward(days: 30),
    duration: Faker::Number.between(from: 15, to: 120),
    user: User.all.sample,
    doctor: Doctor.all.sample
  }
end

Appointment.create!(appointments)





puts "#{Doctor.count} doctors\n #{User.count} users\n #{Specialization.count} specializations\n #{Appointment.count} appointments created"
