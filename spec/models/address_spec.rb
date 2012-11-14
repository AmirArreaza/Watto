# == Schema Information
#
# Table name: addresses
#
#  id                :integer          not null, primary key
#  location_type     :string(255)
#  address_name      :text
#  map_coordinates   :string(255)
#  belong_address_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe Address do
  pending "add some examples to (or delete) #{__FILE__}"
end
