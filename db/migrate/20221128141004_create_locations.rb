class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.float :distance
      t.string :town
      t.string :country

      t.timestamps
    end
  end
end
