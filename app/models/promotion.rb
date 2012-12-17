# == Schema Information
#
# Table name: promotions
#
#  id                :integer          not null, primary key
#  begin_date        :datetime
#  end_date          :datetime
#  resource_path     :string(255)
#  company_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  promotion_type_id :integer
#

class Promotion < ActiveRecord::Base

  	attr_accessible :begin_date,  :promotion_type_id

  	belongs_to :company
  	belongs_to :promotion_types

  	validates :begin_date, presence: true
  	
end