# == Schema Information
#
# Table name: promotion_types
#
#  id         :integer          not null, primary key
#  price      :decimal(2, 2)
#  duration   :integer
#  banner     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

require 'spec_helper'

describe PromotionType do
  pending "add some examples to (or delete) #{__FILE__}"
end
