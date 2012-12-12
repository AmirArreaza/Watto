class Subdepartment < ActiveRecord::Base
	
	attr_accessible :department_id, :description, :name

  	belongs_to :department

  	validates :name, presence: true
  	validates :description, presence: true
  	validates :department_id, presence: true

end