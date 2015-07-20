FactoryGirl.define do
  factory :message do
    user

    body { Faker::Lorem.sentence }
  end
end