FactoryGirl.define do
  factory :post do
    title "Test Title"
    content "some text"
    association :owner, factory: :user
  end
end
