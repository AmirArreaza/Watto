class Address < ActiveRecord::Base
	
	attr_accessible :belong_address, :address_name, :map_coordinates, :type

	validates :address_name, presence: {message: "no puede estar en blanco"}, 
		length: { maximum: 400, message: "no debe tener mas de 400 caracteres"}

	validates :type, presence: { message: "no puede estar en blanco"}

	belongs_to :belong_address, :class_name => "Address", :foreign_key => "belong_address"

	belongs_to :id, :class_name => "Address", :foreign_key => "id"
	
end
