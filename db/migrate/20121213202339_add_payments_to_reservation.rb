class AddPaymentsToReservation < ActiveRecord::Migration
  
  	def up
  		add_column :reservations, :payment_method_id, :integer
  		add_index :reservations, :payment_method_id
	end

end
