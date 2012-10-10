class Product < ActiveRecord::Base
	attr_accessible :description, :name, :stock

	has_many :reservations
  	has_many :users, :through => :reservations, :dependent => :destroy
end
