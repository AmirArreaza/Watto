class BlacklistAddColumns < ActiveRecord::Migration

	def up
  		add_column :blacklists, :duration_days, :integer
  		add_column :blacklists, :end_date, :datetime
  	end

end
