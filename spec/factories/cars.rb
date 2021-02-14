FactoryBot.define do
  factory :car do
    name { Faker::Name.name }
    max_speed { rand(200..600) }
  end
end
