# -*- coding: utf-8 -*-
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
		get_location_details(@address)
		
		if @address.save
			flash[:success] = "Dirección guardada correctamente"
			render 'show'
		else
			flash[:error] = "Se produjo un error en la solicitud"
			load_locations
			render 'new'
		end
	end

	def edit
    	@address = Address.find(params[:id])
    	@countries = Address.where(:location_type => "Country")
    	if @address.location_type == "Country"
    		@states = []
    		@cities = []
    	end

    	if @address.location_type == "State"
    		@country_selected = @address.belong_address_id
    		@states = []
    		@cities = []
    	end

    	if @address.location_type == "City"
    		@state_selected = @address.belong_address_id
    		@state = Address.find(@address.belong_address_id)
    		@country = Address.find(@state.belong_address_id)
    		@country_selected = @country.id
    		@states = Address.where(:belong_address_id => @country.id)
    		@cities = []
    	end

    	if @address.location_type == "Location"
    		@city_selected = @address.belong_address_id
    		@city = Address.find(@address.belong_address_id)
    		@state = Address.find(@city.belong_address_id)
    		@country = Address.find(@state.belong_address_id)
    		@country_selected = @country.id
    		@states = Address.where(:belong_address_id => @country_selected)
    		@state_selected = @state.id
    		@cities = Address.where(:belong_address_id => @state.id)
    	end
  	end

  	def update
    	@address = Address.find(params[:id])
    	@address = get_location_details(@address)
    	if @address.update_attributes(params[:address])
    		flash[:success] = "Dirección modificada correctamente"
      		render 'show'
    	else
    		flash[:error] = "Se produjo un error en la solicitud"
      		render 'edit'
    	end
  	end

	def destroy
		Address.find(params[:id]).destroy
    	redirect_to 'show'
	end|

	def load_locations
		@countries = Address.find(:all, :order=>"address_name", :conditions => {:location_type => "Country"}) 
		@states  = []
		@cities  = []
		@country_selected = 0
		@state_selected = 0
		@city_selected = 0
	end
	
	def get_location_details(address)
		if params[:country_selected] == ""
    		address.belong_address = nil
    		address.location_type = "Country"
    		return address
    	end
    	if params[:state_selected] == ""
    		address.belong_address = Address.find(params[:country_selected])
    		address.location_type = "State"
    		return address
    	end
    	if params[:city_selected] == ""
    		address.belong_address = Address.find(params[:state_selected])
    		address.location_type = "City"
    		return address
    	end
    	address.belong_address = Address.find(params[:city_selected])
    	address.location_type = "Location"
    	return address
	end

	def update_states
  		@states = Address.where(:belong_address_id => params[:id])
  		@cities = []
  		render :partial => "addresses/states", :locals => {:cities => @cities, :states => @states}
	end

	def update_cities
  		@cities = Address.where(:belong_address_id => params[:id])
  		@states = Address.where(:location_type => "State")
  		@state_selected = params[:id]
  		render :partial => "addresses/states", :locals => {:cities => @cities}
	end
end