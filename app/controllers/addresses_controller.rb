class AddressesController < ApplicationController
	def show
		@address = Address.find(params[:id])
	end

	def new
		load_locations
		@address = Address.new
	end

	def create	
		@address = Address.new(params[:address])
		if params[:city_selected] != ""
			@address.belong_address = Address.find(params[:city_selected])
		end
		if @address.save
			flash[:success] = "Se grabo."
			render 'show'
		else
			load_locations
			render 'new'
		end
	end

	def edit
    	@address = Address.find(params[:id])
    	@states  = Address.find(:all, :order=>"address_name", :conditions => {:location_type => "State"})
    	@state_selected = @address.belong_address.belong_address.id
    	@cities = Address.where(:belong_address_id => @state_selected, :location_type => "City")
    	@city_selected = @address.belong_address.id
  	end

  	def update
    	@address = Address.find(params[:id])
    	@address.belong_address = Address.find(params[:city_selected])
    	if @address.update_attributes(params[:address])
      		render 'show'
    	else
      		render 'edit'
    	end
  	end

	def destroy
		Address.find(params[:id]).destroy
    	redirect_to 'new'
	end

	def load_locations
		@states  = Address.find(:all, :order=>"address_name", :conditions => {:location_type => "State", :belong_address_id => 1})
		@cities  = []
		@state_selected = 0
		@city_selected = 0
	end

	def update_cities
  		@cities = Address.where(:belong_address_id => params[:id])
  		render :partial => "cities", :object => @cities
	end
end