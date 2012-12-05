# == Schema Information
#
# Table name: promotions
#
#  id            :integer          not null, primary key
#  begin_date    :datetime
#  end_date      :datetime
#  resource_path :string(255)
#  company_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Promotion < ActiveRecord::Base

  	attr_accessible :begin_date

  	belongs_to :company

  	validates :begin_date, presence: true

  	before_save :calculate_end_date

  	def calculate_end_date
  		self.end_date = self.begin_date + 5.days
  	end
end
