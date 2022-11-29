class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.float :distance
      t.string :town
      t.string :country
      t.references :article

      t.timestamps
    end
  end
end
