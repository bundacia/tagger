FactoryGirl.define do
  factory :tag do
    sequence(:tag) {|n| "tag#{n}"}
    association :entity, :strategy => :build
  end
end

