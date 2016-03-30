require 'rails_helper'

describe TagStatsReport do

  before(:each) do
    3.times do
      entity = FactoryGirl.create(:entity)
      entity.tags.create([ {tag: "A"}, {tag: "B"} ])
    end

    4.times do
      entity = FactoryGirl.create(:entity)
      entity.tags.create([ {tag: "A"}, {tag: "C"} ])
    end
  end

  its(:as_json) do
    should eq({
      tag_counts: [
        {tag: "A", count: 7},
        {tag: "B", count: 3},
        {tag: "C", count: 4},
      ]
    })
  end

end
