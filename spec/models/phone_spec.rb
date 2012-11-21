# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  type       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Phone do
  pending "add some examples to (or delete) #{__FILE__}"
end
