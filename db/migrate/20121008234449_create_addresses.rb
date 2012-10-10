class CreateAddresses < ActiveRecord::Migration
  	def change
    	create_table :addresses do |t|
      	t.string 		  :type
      	t.text 			  :address_name
      	t.string 		  :map_coordinates
      	t.integer 		:belong_address, :null => true
      	t.timestamps
    end
    add_index :addresses , :belong_address
    add_index :addresses , [:id, :belong_address]
  end

end