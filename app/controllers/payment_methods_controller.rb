class PaymentMethodsController < ApplicationController

	def show
		@payment_method = PaymentMethod.find(params[:id])
	end

	def new
		@payment_method = PaymentMethod.new
	end

	def create
		@payment_method = PaymentMethod.new(params[:payment_method])
    	if @payment_method.save
      		flash[:success] = "Se agrego el metodo de pago: #{@payment_method.name}."
      		redirect_to @payment_method
    	else
      		render 'new'
    	end
	end

	def edit
		@payment_method = PaymentMethod.find(params[:id])
	end

	def update
		@payment_method = PaymentMethod.find(params[:id])
    	if @payment_method.update_attributes(params[:payment_method])
      		flash[:sucess] = "Se modifico correctamente la formade pago."
      		redirect_to @payment_method
    	else
      		render "edit"
    	end
	end

	def destroy
    	PaymentMethod.find(params[:id]).destroy
    	redirect_to root_url
  	end

end