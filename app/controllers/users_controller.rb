class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
    	if @user.save
    		redirect_to root_url	
    	else
      		render 'new'
    	end
	end

	def edit
        @user = User.find(params[:id])
  	end

  	def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to 'new'
    else
      render 'edit'
    end
  end


end
