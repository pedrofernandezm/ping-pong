FactoryGirl.define do
  factory :user do
    email { |n| "user#{n}@test.com" }
    password "secret123"
    rating { Random.rand(5000) }
  end
end
