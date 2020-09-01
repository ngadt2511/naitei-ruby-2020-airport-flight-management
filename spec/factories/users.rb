FactoryBot.define do
  factory :user do
    name {Faker::Name.name }
    staff_code {Settings.user.default_staff_code}
    type_account {Faker::Number.within(range: 0..2)}
    unit {Faker::String.random(length: [0, 6])}
    email {Faker::Internet.email}
    password {Settings.user.default_password}
  end
end
