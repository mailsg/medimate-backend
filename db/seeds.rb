require 'faker'

User.destroy_all
Doctor.destroy_all
Appointment.destroy_all
Specialization.destroy_all

users = Array.new(50) do
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
  { name: 'Ophthalmology' },
  { name: 'ENT' },
  { name: 'Endocrinology' },
  { name: 'Gastroenterology' },
  { name: 'Hematology' },
  { name: 'Neurology' },
  { name: 'Obstetrics and Gynecology' },
  { name: 'Oncology' },
  { name: 'Pediatrics' },
  { name: 'Psychiatry' },
  { name: 'Radiology' },
  { name: 'Urology' },
  { name: 'Rheumatology' },
  { name: 'Nephrology' },
  { name: 'Pulmonology' },
  { name: 'Hepatology' },
  { name: 'Emergency Medicine' },
  { name: 'Anesthesiology' },
  { name: 'Physical Medicine and Rehabilitation' },
  { name: 'Internal Medicine' },
  { name: 'Plastic Surgery' },
  { name: 'Vascular Surgery' },
  { name: 'Thoracic Surgery' },
]

Specialization.create!(specializations)

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

appointments = Array.new(50) do
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
