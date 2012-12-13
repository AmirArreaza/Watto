# == Schema Information
#
# Table name: payment_methods
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  maximum_allowed :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PaymentMethod < ActiveRecord::Base

  	attr_accessible :maximum_allowed, :name

  	belong_to :reservation
end
