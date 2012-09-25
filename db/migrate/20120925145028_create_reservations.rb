class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :quantity
      t.float 	:total_cost
      t.date 	:expiration_date

      t.timestamps
    end
    add_index :reservations, :user_id
    add_index :reservations, :product_id
    add_index :reservations, [:user_id, :product_id], unique: true
  end
end
