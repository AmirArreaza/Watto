class CreatePromotions < ActiveRecord::Migration

	def change
    	create_table :promotions do |t|
      		t.datetime :begin_date
      		t.datetime :end_date
      		t.string :resource_path
      		t.integer :company_id

      		t.timestamps
    	end
    	add_index :promotions, :company_id
  	end
  	
end
