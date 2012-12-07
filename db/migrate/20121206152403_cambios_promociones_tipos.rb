class CambiosPromocionesTipos < ActiveRecord::Migration

	def up
		add_column :promotions, :promotion_type_id, :integer
		add_column :promotion_types, :name, :string
  	end
  	
end
