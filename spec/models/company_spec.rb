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

require 'spec_helper'

describe Company do
  pending "add some examples to (or delete) #{__FILE__}"
end
