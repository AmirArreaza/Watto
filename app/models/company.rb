# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  rif             :string(255)
#  commercial_name :string(255)
#  fiscal_name     :string(255)
#  description     :string(255)
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :commercial_name, :description, :fiscal_name, :rif, :phones_attributes

  belongs_to :user
  has_many :products
  has_many :phones, dependent: :destroy
  has_many :promotions, dependent: :destroy

  validates :user_id, presence: true

  accepts_nested_attributes_for :phones

end