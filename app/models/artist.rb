class Artist < ActiveRecord::Base

  has_many :artworks, through: :collaborations
  has_many :collaborations

  validates :name, presence: true



end