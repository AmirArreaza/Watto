class PhonesController < ApplicationController

	def new
		@phone = Phone.new
		@phone.company_id = params[:id]
	end

	def create
		@phone = company_id.phones.build(params[:phone])
    	if @phone.save
      		flash[:success] = "Agregado el nuevo telefono #{@phone.type} ( #{@phone.number} )."
      		render 'new'	
    	else
      		render 'new'
    	end
	end
end
