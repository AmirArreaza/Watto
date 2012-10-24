class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :stock
      t.string :description
      t.integer :company_id

      t.timestamps
    end
    add_index :products, [:company_id]
  end
end
