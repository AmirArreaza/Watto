# == Schema Information
#
# Table name: subdepartments
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :string(255)
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Subdepartment do
  pending "add some examples to (or delete) #{__FILE__}"
end
