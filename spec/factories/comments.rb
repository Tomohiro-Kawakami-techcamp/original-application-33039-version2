FactoryBot.define do
  factory :comment do
    nickname {"匿名"}
    message { "よかったです。" }
    
    association :user
  end
end
