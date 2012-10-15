class AddressesController < ApplicationController

	def show

	end

	def new
		@addr = Address.find(:all)
		@address = Address.new
	end

	def create

		@address = Address.new(params[:address])
		if @address.save
		end
	end

	def edit
    	@address = Address.find(params[:id])
  	end

  	def update
    	@address = Address.find(params[:id])
    	if @address.update_attributes(params[:user])
      		redirect_to 'new'
    	else
      		render 'edit'
    	end
  	end

	def destroy
		Address.find(params[:id]).destroy
    	redirect_to 'new'
	end

end
