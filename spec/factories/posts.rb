FactoryGirl.define do
  factory :post do
    title { FFaker::CheesyLingo.words.join(' ') }
    content { FFaker::CheesyLingo.paragraph }
    association :owner, factory: :user
  end
end
