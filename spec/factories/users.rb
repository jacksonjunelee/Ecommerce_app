FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    # association :product, factory: :product

    factory :user_with_products do
        # posts_count is declared as a transient attribute and available in
        # attributes on the factory, as well as the callback via the evaluator
        transient do
          products_count 2
        end

      after(:create) do |user, evaluator|
          create_list(:product, evaluator.products_count, user: user)
      end
    end
  end
end
