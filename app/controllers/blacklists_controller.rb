class BlacklistsController < ApplicationController
  	def new
  		@blacklist = Blacklist.new
  	end

  	def create
  		@blacklist = Blavcklist.new(params[:blacklist])
    	if @blacklist.save
      		flash[:success] = "Se agrego a la 'Lista Negra' el usuario #{@blacklist.user.name}."
      		redirect_to root_url
    	else
      		render 'new'
    	end
  	end

  	def destroy
  		Blacklist.find(params[:id]).destroy
    	render 'new'
    end
end