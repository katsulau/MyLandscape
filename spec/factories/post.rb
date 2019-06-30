FactoryBot.define do

  factory :post do
    name                  {Faker::Name.name}
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/uploads/post/image/2/glass-3114335_640.jpg')) }
    description           {Faker::Lorem.sentence(4)}
  end

end