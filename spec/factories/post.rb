FactoryBot.define do
  factory :post do
    name                  { Faker::Name.name }
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/first-slide.jpg')) }
    description           { Faker::Lorem.sentence(4) }
  end
end
