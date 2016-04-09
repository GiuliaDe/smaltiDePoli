class AddCollaborationReference < ActiveRecord::Migration
  def change
    add_foreign_key :collaborations, :artworks
    add_foreign_key :collaborations, :artists
  end
end
