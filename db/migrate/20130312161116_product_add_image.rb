class ProductAddImage < ActiveRecord::Migration
  
  def up
	add_column :products, :image, :string
  end
  
end
