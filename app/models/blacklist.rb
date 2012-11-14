# == Schema Information
#
# Table name: blacklists
#
#  id         :integer          not null, primary key
#  reason     :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blacklist < ActiveRecord::Base
  attr_accessible :reason, :user_id
end
