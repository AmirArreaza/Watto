# -*- coding: utf-8 -*-
class PromotionTypesController < ApplicationController

	def show
		@promotion_type = PromotionType.find(params[:id])
	end

	def new
    	@promotion_type = PromotionType.new
  	end

  	def create
    	@promotion_type = PromotionType.new(params[:promotion_type])
    	if @promotion_type.save
      		flash[:success] = "Se agrego correctamente el tipo de promocion."
      		redirect_to @promotion_type	
    	else
      		render 'new'
    	end
  	end

  	def edit
  		@promotion_type = PromotionType.find(params[:id])
  	end

  	def update
  		@promotion_type = PromotionType.find(params[:id])
    	if @promotion_type.update_attributes(params[:promotion_type])
      		flash[:sucess] = "El tipo de promoción se modifico correctamente."
      		redirect_to @promotion_type
    	else
      		render "edit"
    	end
  	end

  	def destroy
    	PromotionType.find(params[:id]).destroy
    	render 'new'
  	end

end