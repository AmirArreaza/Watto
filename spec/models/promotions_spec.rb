# == Schema Information
#
# Table name: promotions
#
#  id            :integer          not null, primary key
#  begin_date    :datetime
#  end_date      :datetime
#  resource_path :string(255)
#  company_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Promotions do
  pending "add some examples to (or delete) #{__FILE__}"
end
