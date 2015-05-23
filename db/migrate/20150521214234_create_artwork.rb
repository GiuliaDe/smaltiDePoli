class CreateArtwork < ActiveRecord::Migration
  def change
    create_table :artworks do |t|

      t.string :name
      t.string :dimension
      t.text :description
      t.text :notes
      t.boolean :production
      t.integer :quantity
      t.string :typology
      t.string :technique
      t.string :linkIUAV
      t.date :infdate
      t.date :supdate
      t.boolean :dateexact

      # TODO to add photo reference



      t.timestamps null: false
    end
  end
end
