class ProductsController < ApplicationController
  
  require 'will_paginate/array'

  def show
    
  end

  def index
    @products = Product.all.paginate(page: params[:page], :per_page => 5)
  end

  def view
  end

  def new
    @product = Product.new
    @company = current_user.companies.find_by_id(params[:company])
    @product.company_id = @company.id
  end

  def create
    @company = current_user.companies.find_by_id(params[:company])
    @product = @company.products.build(params[:product])
    if @product.save
      flash[:sucess] = "El producto #{@product.name} se ha creado para la empresa #{@company.commercial_name}"
      redirect_to @company 
    else
      redirect_to @company 
    end
  end

  def delete
  end
end
