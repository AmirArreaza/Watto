class AddressesController < ApplicationController
	def show
	end

	def new
		@address = Address.new
		@states  = Address.find(:all, :order=>"address_name", :conditions => {:location_type => "State"})
		@cities  = []
	end

	def create
		if params[:address][:belong_address].to_i == 0
			params[:address][:belong_address] = nil
		else
			@BelongAddress = Address.find(params[:address][:belong_address].to_i)
			params[:address][:belong_address] = @BelongAddress
		end
		@address = Address.new(params[:address])
		if @address.save
		else
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

	def update_cities
    	# updates artists and songs based on genre selected
    	@states = Address.find(:all, :order=>"address_name", :conditions => {:location_type => "State"})
    	@cities = Address.find(:all, :order=>"address_name", :conditions => {:location_type => "City", :belong_address => params[:genre_id]})
    	@cities = @cities.map{|a| [a.address_name, a.id]}.insert(0, "Select an City")
  	end	

end
