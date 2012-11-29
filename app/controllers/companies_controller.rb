class CompaniesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy, :update, :edit]

  def new
    @company = Company.new
  end

  def index
    @companies = Company.all.paginate(page: params[:page])
  end

  def show
    @company = Company.find(params[:id])
    @products = @company.products.paginate(page: params[:page])
  end

  def create
    @company = current_user.companies.build(params[:company])
    if @company.save
      flash[:sucess] = "La empresa #{@company.commercial_name} ha sido creada."
      redirect_to @company
    else
      render "new"
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:sucess] = "La empresa #{@company.commercial_name} ha sido modificada."
      redirect_to @company
    else
      render "edit"
    end
  end

  def destroy
    Company.find(params[:id]).destroy
    redirect_to current_user
  end
end
