# -*- coding: utf-8 -*-
class PromotionsController < ApplicationController
	
	def show
    	@promotion = Promotion.find(params[:id])
	end

	def new
    	@promotion = Promotion.new
  	end

  	def create
    	@promotion = Promotion.new(params[:promotion])
    	if @promotion.save
      		flash[:success] = "La promoción se asigno correctamente."
      		redirect_to @promotion
    	else
      		render 'new'
    	end
  	end

  	def edit
    	@promotion = Promotion.find(params[:id])
  	end

  	def update
    	@promotion = Promotion.find(params[:id])
    	if @promotion.update_attributes(params[:promotion])
      		flash[:sucess] = "La promocion se modifico correctamente."
      		redirect_to @promotion
    	else
      		render "edit"
    	end
  	end

end
