# -*- coding: utf-8 -*-
class ReservationsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :show, :destroy, :update, :edit]

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(params[:reservation])
		@reservation.user_id = current_user
		if verify_reservation (@reservation.product_id)
    		if @reservation.save
      			flash[:success] = "Se hizo la reservación del porducto #{@reservation.product_id} la cantidad de  #{@reservation.quantity}."
      			redirect_to :action => "show", :id => @reservation.product_id
    		else
      			render 'new'
    		end
    	else
    		@Old_Reservation = Reservation.where(:user_id=>current_user).where(:product_id=>@reservation.product_id).first
    		flash[:error] = "Usted tiene vigente una reservación de este producto. Esta expira el: #{@Old_Reservation.expiration_date}"
			render 'new'
		end
	end

	def show
		@reservation = Reservation.where(:user_id=>current_user).where(:product_id=>params[:id]).first
	end

	def destroy
    	Reservation.find(params[:user_id, :product_id]).destroy
    	redirect_to 'new'
  	end

  	private 
  	
  	def verify_reservation(product_id)
		@Old_Reservation = Reservation.where(:user_id=>current_user).where(:product_id=>product_id).first
		if @Old_Reservation then
			if @Old_Reservation.expiration_date < Time.zone.now 
				true
			else
				false
			end
		else
			true
		end
	end
end