FactoryBot.define do

  factory :contract do
    numero { FFaker::Lorem.characters[1..10] }
    details { FFaker::LoremFR.sentence }
    amount { rand(100..1000) }
    begin_date { FFaker::Time.date }
    end_date { FFaker::Time.date }
  end
end
