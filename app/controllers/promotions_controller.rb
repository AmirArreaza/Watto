# -*- coding: utf-8 -*-
class PromotionsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :destroy, :update, :edit]
	helper :promotions

	def show
    	@promotion = Promotion.find(params[:id])
	end

	def new
    	@promotion = Promotion.new
    	@company = current_user.companies.find_by_id(params[:company])
    	@promotion.company_id = @company.id
  	end

  	def create
    	@company = current_user.companies.find_by_id(params[:company])
    	@promotion = @company.promotions.build(params[:promotion])
    	calculate
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
    	calculate_end_date
    	if @promotion.update_attributes(params[:promotion])
      		flash[:sucess] = "La promocion se modifico correctamente."
      		redirect_to @promotion
    	else
      		render "edit"
    	end
  	end

  	def destroy
    	Promotion.find(params[:id]).destroy
    	render 'new'
  	end

end
