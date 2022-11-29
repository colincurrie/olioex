class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :donation_description
      t.string :section
      t.references :location, foreign_key: true
      t.string :collection_notes
      t.references :value, foreign_key: true
      t.string :status
      t.timestamp :expiry
      t.references :reaction, foreign_key: true
      t.boolean :is_owner
      t.references :photos, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamp :last_listed

      t.timestamps
    end
  end
end
