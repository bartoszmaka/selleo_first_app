FactoryGirl.define do
  factory :comment do
    content "some comment"
    association :owner, factory: :user
    association :post
  end
end
