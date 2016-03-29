require 'rails_helper'

describe SetEntityTags do
  subject {
    described_class.new(
      :entity_id   => entity_id  ,
      :entity_type => entity_type,
      :tags        => tags       ,
    )
  }

  let(:entity_id)   { "abc123" }
  let(:entity_type) { "product" }
  let(:tags) { ["a", "b" ,"c"] }

  let(:persisted_tags) { Entity.first.tags.map(&:tag).sort }

  context "when entity does not already exists" do
    it "creates the entity" do
      expect { subject.call }.to change { Entity.count }.from(0).to(1)
    end

    it "creates the tags" do
      subject.call
      expect(persisted_tags).to eq tags
    end
  end

  context "when entity already exists" do
    let!(:entity) {
      FactoryGirl.create(:entity_with_tags,
        :tag_count   => 4          ,
        :entity_type => entity_type,
        :external_id => entity_id  ,
      )
    }
    let!(:original_tags) { entity.tags.map(&:tag).sort }

    it "overrides the existing tags" do
      subject.call
      expect(persisted_tags).to eq tags
      expect(persisted_tags).not_to eq original_tags
    end
  end
end
