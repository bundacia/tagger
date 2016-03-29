require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'persists' do
    expect { FactoryGirl.create(:entity) }.to change { described_class.count }.by 1
  end
end
