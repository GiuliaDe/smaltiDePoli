class Artwork < ActiveRecord::Base

  validates :name, presence: true
  validates :production, presence: true

end
