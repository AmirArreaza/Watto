class Product < ActiveRecord::Base
  attr_accessible :description, :name, :stock
end
