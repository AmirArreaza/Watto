class BlacklistsController < ApplicationController
  	def new
  		@blacklist = Blacklist.new
  	end

  	def destroy
        Blacklist.find(params[:user_id]).destroy
        flash[:success] = "Usuario Reactivado"
        redirect_to root_url
    end
end