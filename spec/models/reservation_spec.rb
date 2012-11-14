# == Schema Information
#
# Table name: reservations
#
#  id              :integer          not null, primary key
#  product_id      :integer
#  user_id         :integer
#  quantity        :integer
#  total_cost      :float
#  expiration_date :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Reservation do
  pending "add some examples to (or delete) #{__FILE__}"
end
