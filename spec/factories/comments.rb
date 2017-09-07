FactoryGirl.define do
  factory :comment do
    content { FFaker::CheesyLingo.paragraph }
    owner
    post
  end
end
