class Address < ActiveRecord::Base
	
	attr_accessible :belong_address, :address_name, :map_coordinates, :location_type

	validates :address_name, presence: {message: "no puede estar en blanco"}, 
				length: { maximum: 400, message: "no debe tener mas de 400 caracteres"}
	validates :location_type, presence: { message: "no puede estar en blanco"}

	belongs_to :belong_address, class_name: "Address"
	has_many :addresses, :through => :belong_address 
end