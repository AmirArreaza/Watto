# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  type       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phone < ActiveRecord::Base

	attr_accessible :number, :phone_type

	belongs_to :company

	validates_presence_of :number, :if => :type_selected?


	def type_selected?
  		if self.phone_type == "" then
  			logger.debug "type_selected return false"
  			self.destroy
  			false
  		else
  			logger.debug "type_selected return true"
  			true
  		end
	end

end
