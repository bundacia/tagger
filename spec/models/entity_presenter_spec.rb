require 'rails_helper'

describe EntityPresenter do

  subject { described_class.new entity }

  let(:entity) do
    FactoryGirl.create(:entity, entity_type: "foo", external_id: "123").tap do |e|
      e.tags.create({tag: "tag1"})
    end
  end

  its(:as_json) {
    should eq({
      :entity_id   => "123"   ,
      :entity_type => "foo"   ,
      :tags        => ["tag1"],
    })
  }

end
