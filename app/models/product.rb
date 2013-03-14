# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  stock       :integer
#  description :string(255)
#  company_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :description, :name, :stock, :image

  has_many :reservations
  has_many :users, :through => :reservations, :dependent => :destroy
  belongs_to :company
  
  mount_uploader :image, ProductsUploader
  
end
