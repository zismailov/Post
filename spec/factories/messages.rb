FactoryGirl.define do
  factory :message do
    title { FFaker::Lorem.word }
    content { FFaker::Lorem.paragraph }
    draft false
    association :sender, factory: :user
    association :receiver, factory: :user
  end
end
