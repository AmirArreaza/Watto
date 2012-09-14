class Blacklist < ActiveRecord::Base
  attr_accessible :reason, :user_id
end
