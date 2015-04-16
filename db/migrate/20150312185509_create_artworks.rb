class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :dimension
      t.text :description
      t.text :notes
      t.boolean :production
      t.integer :quantity


      t.timestamps null: false
    end


  end
end
