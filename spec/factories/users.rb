FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"
    initialize_with { User.find_or_create_by(email: email) }
  end
end
