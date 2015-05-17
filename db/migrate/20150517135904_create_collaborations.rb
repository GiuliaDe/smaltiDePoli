class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations, id: false do |t|
      t.integer :artwork_id
      t.integer :artist_id
      t.text :kind
    end

    add_index :collaborations, :artwork_id
    add_index :collaborations, :artist_id

  end
end
