class CreateBlacklists < ActiveRecord::Migration
  	def change
		create_table :blacklists do |t|
      		t.string :reason
      		t.integer :user_id

      		t.timestamps
    	end
    	add_index :blacklists, [:user_id, :created_at]
  end
end
