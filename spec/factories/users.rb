FactoryBot.define do
  factory :user do
    name { "user01" }
    email { "test01@sample.com" }
    password { "aaaaaa" }
    password_confirmation { "aaaaaa" }
    icon { Rack::Test::UploadedFile.new(File.join(Rails.root, "./db/fixtures/icon00.jpg")) }
  end
  # factory :user02, class: User do
  #   name { "user2" }
  #   email { "test02@sample.com" }
  #   password { "aaaaaa" }
  #   password_confirmation { "aaaaaa" }
  #   icon open("./db/fixtures/icon00.jpg")
  # end
end
