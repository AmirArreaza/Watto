# == Schema Information
#
# Table name: blacklists
#
#  id            :integer          not null, primary key
#  reason        :string(255)
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  duration_days :integer
#  end_date      :datetime
#

require 'spec_helper'

describe Blacklist do
  pending "add some examples to (or delete) #{__FILE__}"
end
