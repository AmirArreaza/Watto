class ProductsController < ApplicationController
  def index
  end

  def view
  end

  def new
    @product = Product.new
  end

  def create
    @company = current_user.companies{|company| company.id == params[:product][:company_id]}
    @product = @company.products.build(params[:product])
    if @product.save
      flash[:sucess] = "El procucto #{@procuct.name} se ha creado para la empresa #{@company.commercial_name}"
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  def delete
  end
end
