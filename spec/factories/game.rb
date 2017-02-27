FactoryGirl.define do
  factory :game do
    user
    association :opponent, factory: :user
    date_played { Date.today }
    user_score { Random.rand(22) }
    opponent_score { Random.rand(22) }
  end
end
