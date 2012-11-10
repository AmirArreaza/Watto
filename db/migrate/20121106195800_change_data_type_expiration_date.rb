class ChangeDataTypeExpirationDate < ActiveRecord::Migration
  
	def change
  		change_table :reservations do |t|  
  			t.change :expiration_date, :datetime 
		end
  	end

end
