class CreateAvatars < ActiveRecord::Migration[7.0]
  def change
    create_table :avatars do |t|
      t.string :original_url
      t.string :large_url
      t.string :small_url

      t.timestamps
    end
  end
end
