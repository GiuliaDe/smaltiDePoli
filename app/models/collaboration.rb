class Collaboration < ActiveRecord::Base

  belongs_to :artist
  belongs_to :artwork

  validates :artist_id, presence: true
  validates :artwork_id, presence: true

end