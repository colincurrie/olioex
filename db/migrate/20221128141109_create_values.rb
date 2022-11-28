class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|
      t.float :price
      t.string :currency
      t.string :payment_type

      t.timestamps
    end
  end
end
