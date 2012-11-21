class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:update, :edit]
  
  def show
    @user = User.find(params[:id])
    @companies = @user.companies.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Bienvenido #{@user.first_name} #{@user.last_name} a TITULO."
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

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end
end
