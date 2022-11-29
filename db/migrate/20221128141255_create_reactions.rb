class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.integer :likes
      t.boolean :by_user
      t.integer :views
      t.integer :impressions
      t.references :article

      t.timestamps
    end
  end
end
