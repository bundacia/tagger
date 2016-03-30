require 'rails_helper'

describe EntityStatsPresenter do

  subject { described_class.new entity }

  let(:entity) { FactoryGirl.create(:entity_with_tags, tag_count: 6) }

  its(:as_json) { should eq({tag_count: 6}) }

end
