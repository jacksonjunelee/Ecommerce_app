FactoryGirl.define do
  factory :product do
    name { Faker::Lorem.word }
    price { Faker::Number.number(4) }
    quantity { Faker::Number.number(1) }
    description {Faker::Lorem.sentence}
    url {Faker::Avatar.image}
  end
end
