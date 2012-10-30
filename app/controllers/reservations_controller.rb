# -*- coding: utf-8 -*-
class ReservationsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :destroy, :update, :edit]

	def show
		@reservation = Reservation.find(params[:user_id, :product_id])
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(params[:reservation])
		@reservation.user_id = current_user
    	if @reservation.save
      		flash[:success] = "Se hizo la reservación del porducto #{@reservation.product_id} la cantidad de  #{@reservation.quantity}."
      		redirect_to @reservation	
    	else
      		render 'new'
    	end
	end

	def destroy
    	Reservation.find(params[:user_id, :product_id]).destroy
    	redirect_to 'new'
  	end
end
