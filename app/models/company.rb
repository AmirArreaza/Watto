class Company < ActiveRecord::Base
    attr_accessible :commercial_name, :description, :fiscal_name, :rif
    
    belongs_to :user
    
    validates :user_id, presence: true
end
