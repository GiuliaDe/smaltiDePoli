class AddPictureColumnToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :picture, :string
  end
end
