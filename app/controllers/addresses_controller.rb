class AddressesController < ApplicationController

	def show

	end

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(params[:address])
		if @address.save
		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

end
