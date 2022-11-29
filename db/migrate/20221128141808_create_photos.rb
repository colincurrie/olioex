class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :uid, null: false
      t.string :original_url
      t.string :large_url
      t.string :medium_url
      t.string :small_url
      t.integer :width
      t.integer :height
      t.references :article

      t.timestamps
    end
  end
end
