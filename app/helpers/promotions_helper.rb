module PromotionsHelper

	def calculate_end_date
		@promotion_type = PromotionType.find(params[:promotion][:promotion_type_id])
  		@promotion.end_date = @promotion.begin_date + @promotion_type.duration.days
  	end

end
