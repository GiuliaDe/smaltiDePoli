class AddForeignKeyDeleteCascadeToCollaborations < ActiveRecord::Migration
  def change
      remove_foreign_key :collaborations, :artworks
      remove_foreign_key :collaborations, :artists

      add_foreign_key :collaborations, :artworks, dependent: :delete
      add_foreign_key :collaborations, :artists, dependent: :delete
  end
end
