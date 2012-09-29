class Reservation < ActiveRecord::Base
	attr_accessible :quantity, :product_id

  	belongs_to :user
  	belongs_to :product

	validates :quantity, presence: true
  	validates :user_id, presence: true
  	validates :product_id, presence: true
  	validates :expiration_date, presence: true

  	before_save :calculate_expiration_date
  	before_save :calculate_total_cost

	private 
		
		def calculate_expiration_date
			self.expiration_date = self.created_at + 5.days
		end

		def calculate_total_cost
			#Sin implementar, falta el costo de los productos
			#self.total_cost = self.quantity * @product.cost
		end
end