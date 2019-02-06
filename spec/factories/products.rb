FactoryBot.define do

  factory :product do
    name {"111"}
    detail {"222"}
    status {"333"}
    delivery_fee {"444"}
    area {"555"}
    shipping_dates {"666"}
    price {"777"}
    delivery_status {"999"}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
