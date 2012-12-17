# == Schema Information
#
# Table name: reservations
#
#  id                :integer          not null, primary key
#  product_id        :integer
#  user_id           :integer
#  quantity          :integer
#  total_cost        :float
#  expiration_date   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  payment_method_id :integer
#

class Reservation < ActiveRecord::Base
	attr_accessible :quantity, :product_id

  	belongs_to :user
  	belongs_to :product

	validates :quantity, presence: true
	validates :product_id, presence: true

	before_create :calculate_expiration_date

	private 
		
		def calculate_expiration_date
			self.expiration_date = Time.zone.now + 5.days
		end

		def calculate_total_cost
			#Sin implementar, falta el costo de los productos
			#self.total_cost = self.quantity * @product.cost
		end
end
