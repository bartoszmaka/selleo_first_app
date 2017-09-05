FactoryGirl.define do
  factory :comment do
    content { FFaker::CheesyLingo.paragraph }
    association :owner, factory: :user
    association :post
  end
end
