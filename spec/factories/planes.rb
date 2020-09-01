FactoryBot.define do
  arr_braned = Settings.plane.braned_array
  factory :plane do
    name {"VN-2020#{Faker::Number.between(from: 1, to: 10)}"}
    status {Settings.plane.default_status}
    braned {arr_braned[Faker::Number.between(from: 0, to: 3)]}
  end
end
