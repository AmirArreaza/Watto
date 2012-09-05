class AgregarSal < ActiveRecord::Migration
  	def up
		add_column :users, :salt, :string
  	end

  def down
  end
end
