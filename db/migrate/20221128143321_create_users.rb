class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.references :avatar, null: false, foreign_key: true
      t.float :location_latitude
      t.float :location_longitude
      t.integer :rating
      t.integer :rating_number

      t.timestamps
    end
  end
end
