require 'rails_helper'

RSpec.describe Artwork, type: :model do

  before do
    @artwork = FactoryGirl.create(:artwork)
  end

  it 'has valid factories' do
    expect(@artwork).to be_valid
  end


  it 'is invalid without a name' do
    expect(FactoryGirl.build(:artwork, name: nil)).not_to be_valid
  end


end
