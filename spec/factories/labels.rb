include RandomData

FactoryGirl.define do
  factory :label do
   sequence(:name){|n| "#{RandomData.random_word}#{n}" }
  end
end