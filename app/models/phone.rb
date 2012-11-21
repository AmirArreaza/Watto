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

	attr_accessible :number, :type

	belongs_to :company
	
	validates :company_id, presence: true
end
