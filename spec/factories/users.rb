FactoryGirl.define do
  factory :user do
    name { "#{FFaker::CheesyLingo.word}#{rand(50000)}" }
    email { "#{name}@factory.com" }
    password "123123"
    initialize_with { User.find_or_create_by(email: email) }
  end
end
