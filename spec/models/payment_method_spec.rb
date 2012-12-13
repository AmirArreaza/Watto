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

require 'spec_helper'

describe PaymentMethod do
  pending "add some examples to (or delete) #{__FILE__}"
end
