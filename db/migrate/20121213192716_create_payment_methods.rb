class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.float :maximum_allowed

      t.timestamps
    end
  end
end
