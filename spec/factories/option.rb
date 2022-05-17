FactoryBot.define do

  factory :option do
    code { FFaker::Lorem.characters[1..10].parameterize('_') }
    description { FFaker::LoremFR.sentence }
  end
end
