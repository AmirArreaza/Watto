# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Department < ActiveRecord::Base

	attr_accessible :description, :name

	has_many :subdepartments, :dependent => :destroy

	validates :name, presence: true
	validates :description, presence: true

end
