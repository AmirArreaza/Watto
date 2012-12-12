class SubdepartmentsController < ApplicationController

	def show
		@subdepartment = Subdepartment.find(params[:id])
	end

	def new
		@subdepartment = Subdepartment.new
	end

	def create
		@subdepartment = Subdepartment.new(params[:subdepartment])
    	if @subdepartment.save
      		flash[:success] = "Se agrego al departamento #{@subdepartment.department.name} el subdepartamento: #{@subdepartment.name}."
      		redirect_to @subdepartment
    	else
      		render 'new'
    	end
	end

	def edit
    	@subdepartment = Subdepartment.find(params[:id])
  	end

  	def update
    	@subdepartment = Subdepartment.find(params[:id])
    	if @subdepartment.update_attributes(params[:subdepartment])
      		flash[:sucess] = "El subdepartamento se modifico correctamente."
      		redirect_to @subdepartment
    	else
      		render "edit"
    	end
  	end

  	def destroy
    	Subdepartment.find(params[:id]).destroy
    	render 'new'
  	end

end
