FactoryBot.define do

  factory :user do
    email { FFaker::InternetSE.email }
    password { FFaker::Internet.password }
    first_name { FFaker::NameFR.first_name }
    last_name { FFaker::NameFR.last_name }
    birth_date { FFaker::Time.date }

    trait :user do
      role { 0 }
    end

    trait :admin do
      role { 1 }
    end
  end
end
