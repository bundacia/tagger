FactoryGirl.define do
  factory :entity do
    entity_type "type1"
    sequence(:external_id) {|n| "abc-#{n}" }

    factory :entity_with_tags do
      transient do
        tag_count 5
      end

      after(:create) do |entity, evaluator|
        create_list(:tag, evaluator.tag_count, entity: entity)
      end
    end
  end
end
