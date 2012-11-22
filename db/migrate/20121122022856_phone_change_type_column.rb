class PhoneChangeTypeColumn < ActiveRecord::Migration
  
	def up
  		change_table :phones do |t|
      		t.rename :type, :phone_type
    	end
  	end

end
