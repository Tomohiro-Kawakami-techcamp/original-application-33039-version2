FactoryBot.define do
  factory :food do
    name {"Item"}
    price { 15000 }
    
    association :user

    after(:build) do |food|
      food.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
