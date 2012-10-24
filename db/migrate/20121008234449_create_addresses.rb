class CreateAddresses < ActiveRecord::Migration
  	def change
    	create_table :addresses do |t|
    		
      	t.string 		    :location_type
      	t.text 			    :address_name
      	t.string 		    :map_coordinates
      	t.integer 		  :belong_address_id, :null => true
      	t.timestamps
    end
    add_index :addresses, :belong_address_id
  end

end