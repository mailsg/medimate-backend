require 'faker'

user = User.new(
  provider: 'email',
  uid: 'user@example.com',
  encrypted_password: 'password_hash',
  sign_in_count: 0,
  current_sign_in_at: nil,
  last_sign_in_at: nil,
  current_sign_in_ip: nil,
  last_sign_in_ip: nil,
  reset_password_token: nil,
  reset_password_sent_at: nil,
  allow_password_change: false,
  remember_created_at: nil,
  confirmation_token: nil,
  confirmed_at: Time.now,
  confirmation_sent_at: Time.now,
  unconfirmed_email: nil,
  username: 'sample_user',
  email: 'user@example.com',
  tokens: {},
  created_at: Time.now,
  updated_at: Time.now
)
user.skip_confirmation!
user.save!