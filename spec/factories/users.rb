FactoryBot.define do
  factory :user do
    name { "user01" }
    email { "test01@sample.com" }
    password { "aaaaaa" }
    password_confirmation { "aaaaaa" }
    icon { Rack::Test::UploadedFile.new(File.join(Rails.root, "./db/fixtures/icon00.jpg")) }
  end
  factory :second_user, class: User do
    name { "user02" }
    email { "test02@sample.com" }
    password { "aaaaaa" }
    password_confirmation { "aaaaaa" }
    icon { Rack::Test::UploadedFile.new(File.join(Rails.root, "./db/fixtures/icon01.jpg")) }
  end
end
