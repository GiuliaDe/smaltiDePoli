require 'rails_helper'

RSpec.describe Artwork, type: :model do

  before do
    @artwork = FactoryGirl.create(:artwork)
  end

  it 'has valid factories' do
    expect(@artwork).to be_valid
  end

describe "validations" do
  it 'is invalid without a name' do
    expect(FactoryGirl.build(:artwork, name: nil)).not_to be_valid
  end

  it 'is invalid if name length is too long' do
    expect(FactoryGirl.build(:artwork, name: "ciotola"*20)).not_to be_valid
 #  is_expected.to ensure_length_of(:type).is_at_most(20)
  end

  it 'is invalid if dimension length is too long' do
    expect(FactoryGirl.build(:artwork, dimension: "10cmx20cmx5cm"*10)).not_to be_valid
  end

  it 'is invalid if description length is too long' do
    expect(FactoryGirl.build(:artwork, description: "opera creata"*40)).not_to be_valid
  end

  it 'is invalid if notes length is too long' do
    expect(FactoryGirl.build(:artwork, notes: "esistono diverse ..."*40)).not_to be_valid
  end

  it 'is invalid if typology length is too long' do
    expect(FactoryGirl.build(:artwork, typology: "sbalzo"*10)).not_to be_valid
  end

  it 'is invalid if technique length is too long' do
    expect(FactoryGirl.build(:artwork, technique: "rame"*20)).not_to be_valid
  end

  it 'is invalid if quantity is not a number' do
    expect(FactoryGirl.build(:artwork, quantity: "vaso")).not_to be_valid
  end


  it 'is invalid if typology is not in defined list' do
    expect(FactoryGirl.build(:artwork, typology: "oro")).not_to be_valid
  end

  it 'is valid if typology is defined in list' do
    expect(FactoryGirl.build(:artwork, typology: "sbalzo")).to be_valid
  end


  it 'is invalid if technique is defined in list' do
    expect(FactoryGirl.build(:artwork, technique: "prova")).not_to be_valid
  end


  it 'is valid if technique is defined in list' do
    expect(FactoryGirl.build(:artwork, technique: "rame")).to be_valid
  end

  it 'is invalid if inferior date is below limit' do
    expect(FactoryGirl.build(:artwork, infdate: Date.new(1899,1,1))).not_to be_valid
  end

  it 'is invalid if inferior date is above limit' do
    expect(FactoryGirl.build(:artwork, infdate: Date.new(2001,1,1))).not_to be_valid
  end

  it 'is valid if inferior date is inside range' do
    expect(FactoryGirl.build(:artwork, supdate: nil, infdate: Date.new(1930,1,1))).to be_valid
  end

  it 'is invalid if superior date is below limit' do
    expect(FactoryGirl.build(:artwork, supdate: Date.new(1899,1,1))).not_to be_valid
  end

  it 'is invalid if superior date is above limit' do
    expect(FactoryGirl.build(:artwork, supdate: Date.new(2001,1,1))).not_to be_valid
  end

  it 'is valid if superior date is inside range' do
    expect(FactoryGirl.build(:artwork, infdate: nil, supdate: Date.new(1930,1,1))).to be_valid
  end

  it 'is invalid is superior date is before inferior date' do
    expect(FactoryGirl.build(:artwork, infdate: Date.new(1940,1,1), supdate: Date.new(1935,1,1))).not_to be_valid
  end

end

end
