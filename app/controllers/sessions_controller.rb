# -*- coding: utf-8 -*-

class SessionsController < ApplicationController

	def new
  	end

  	def create
  		user = User.find_by_email(params[:session][:email].downcase)
    	if user && user.authenticate(params[:session][:password])
      		if (user.blacklisted(user.id))
      			b = Blacklist.find_by_user_id(user.id)
      			flash[:error] = 'Su usuario esta desactivado por la siguiente razón: ' + b.reason # Not quite right!
      			render 'new'	
      		else
      			sign_in user
      			redirect_back_or root_url
      		end
    	else
      		flash[:error] = 'Contraseña invalida' # Not quite right!
      		render 'new'
    	end
  	end

    def delete
    end
    
  	def destroy
        sign_out
        redirect_to root_url
  	end
end
