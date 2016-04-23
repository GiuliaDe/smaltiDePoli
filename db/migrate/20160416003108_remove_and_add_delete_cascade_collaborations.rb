class RemoveAndAddDeleteCascadeCollaborations < ActiveRecord::Migration
  def change
      remove_foreign_key :collaborations, :artworks
      remove_foreign_key :collaborations, :artists

      add_foreign_key :collaborations, :artworks, on_delete: :cascade
      add_foreign_key :collaborations, :artists, on_delete: :cascade
  end
end
