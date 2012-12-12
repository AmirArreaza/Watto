class DepartmentsController < ApplicationController

	def show
    	@department = Department.find(params[:id])
	end

	def new
    	@department = Department.new
  	end

  	def create
  		@department = Department.new(params[:department])
    	if @department.save
      		flash[:success] = "Se agrego el departamento correctamente."
      		redirect_to @department
    	else
      		render 'new'
    	end
  	end

  	def edit
    	@department = Department.find(params[:id])
  	end

  	def update
    	@department = Department.find(params[:id])
    	if @department.update_attributes(params[:department])
      		flash[:sucess] = "El departamento se modifico correctamente."
      		redirect_to @department
    	else
      		render "edit"
    	end
  	end

  	def destroy
    	Department.find(params[:id]).destroy
    	render 'new'
  	end

end
