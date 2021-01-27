FactoryBot.define do
  factory :comment do
      nickname {"hoge"}
      message {"よろしくお願いします。"}
      association :user
  end
end