FactoryBot.define do

  pass = Faker::Internet.password(8)

  factory :user, class: User do
    name                  {Faker::Name.name}
    image                 {"xxxx.jpg"}
    email                 {Faker::Internet.email}
    password              {pass}
    password_confirmation {pass}
  end

end