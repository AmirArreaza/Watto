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

class Blacklist < ActiveRecord::Base
  	attr_accessible :reason, :user_id

  	blongs_to :users

	validates :reason, 	presence: { message: "no puede estar en blanco" }
	
	validates :user_id, presence: { message: "no puede estar en blanco" }

end
