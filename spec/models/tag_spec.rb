require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'persists' do
    expect { FactoryGirl.create(:tag) }.to change { described_class.count }.by 1
  end
end
