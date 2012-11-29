class CreatePhones < ActiveRecord::Migration

	def change
    	create_table :phones do |t|
      		t.string :number
      		t.string :type
      		t.integer :company_id

      		t.timestamps
    	end
  		add_index :phones, [:company_id]
  	end
end
