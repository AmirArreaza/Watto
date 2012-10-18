class AddressesController < ApplicationController
	def show
		@address = Address.find(params[:id])
	end

	def new
		@states  = Address.find(:all, :order=>"address_name", :conditions => {:location_type => "Country"})
		@cities  = []
		@s_city = ''
		@address = Address.new
	end

	def create
		
		@address = Address.new(params[:address])
		@address.belong_address = Address.find(params[:city_selected])
		if @address.save
			flash[:success] = "Se grabo."
			render 'show'
		else
			flash[:error] = "Fallo."
			render 'new'
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

	def update_versions
  		@cities = Address.where(:belong_address_id => params[:id])
  		render :partial => "cities", :object => @cities
	end
end