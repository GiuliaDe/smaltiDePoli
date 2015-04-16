FactoryGirl.define do
  factory :artwork do
    name 'Ciotola'
    dimension '23h3d'
    description 'tipo opera'
    notes 'opera datata..'
    production true
    quantity 1
    type 'sbalzo'
    technique 'rame'
    linkIUAV 'Homepage IUAV'
    infdate Date.new(1954,1,1)
    supdate Date.new(1958,1,1)
    dateexact true


  end


end