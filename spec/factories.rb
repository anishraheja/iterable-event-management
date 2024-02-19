FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end

FactoryBot.define do
  factory(:event) do
    name { Faker::Internet.name }
    event_type { 'event_a' }
    event_code { 'event_code' }
  end
end

