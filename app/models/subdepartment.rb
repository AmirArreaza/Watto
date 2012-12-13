# == Schema Information
#
# Table name: subdepartments
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :string(255)
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Subdepartment < ActiveRecord::Base
	
	attr_accessible :department_id, :description, :name

  	belongs_to :department

  	validates :name, presence: true
  	validates :description, presence: true
  	validates :department_id, presence: true

end
