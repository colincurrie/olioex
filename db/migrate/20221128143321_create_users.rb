class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.references :avatar
      t.float :latitude
      t.float :longitude
      t.integer :rating
      t.integer :number

      t.timestamps
    end
  end
end
