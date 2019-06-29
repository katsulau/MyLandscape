FactoryBot.define do
  factory :comment do
    text            {Faker::Lorem.sentence(4)}
  end
end
