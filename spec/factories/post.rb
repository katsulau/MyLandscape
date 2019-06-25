FactoryBot.define do

  factory :post do
    name                  {"testname"}
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/uploads/post/image/2/glass-3114335_640.jpg')) }
    description           {"綺麗な風景です"}
  end

end