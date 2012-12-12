class Department < ActiveRecord::Base

	attr_accessible :description, :name

	has_many :subdepartments, :dependent => :destroy

	validates :name, presence: true
	validates :description, presence: true

end