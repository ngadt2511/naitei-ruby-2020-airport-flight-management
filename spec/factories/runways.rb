FactoryBot.define do
  factory :runway do
    name {"Runway#{Faker::Number.between(from: 1, to: 10)}"}
    status {Settings.runway.default_status}
  end
end
