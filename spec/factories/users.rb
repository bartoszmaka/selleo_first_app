FactoryGirl.define do
  factory :user, aliases: %i[owner] do
    email { "#{FFaker::Internet.email}" }
    name { email.split('@').first }
    password "123123"
    initialize_with { User.find_or_create_by(email: email) }

    trait :admin do
      role 'admin'
    end

    factory :admin, traits: %i[admin]
  end
end
