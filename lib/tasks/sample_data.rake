namespace :db do
    desc "Llenar BD con ejemplos"
    task populate: :environment do
        make_users
    	make_companies
        make_products
    end

    def make_users
    	10.times do |n|
            name  = Faker::Name.name
            apellido = Faker::Name.name
            email = "Ejemplo-#{n+1}@Watto.org"
            password  = "111111"
            id_number = 100 +n+1
            User.create!(first_name: name,
                        last_name: email,
                        id_number: id_number,
                        email: email,
                        password: password,
                        password_confirmation: password)
        end
    end

    def make_companies
    	users = User.all
    	users.each { |user| 
    		nombre_comercial = Faker::Company.name
    		descripcion = "Descripcion de " + nombre_comercial
    		nombre_fiscal = "Fiscal " + Faker::Company.name
    		rif = "J-" + Faker::Address.zip_code
    		user.companies.create!(
    					commercial_name: nombre_comercial,
    					description: descripcion,
    					fiscal_name: nombre_fiscal,
    					rif: rif) }
  	end

    def make_products
    	companies = Company.all
    	companies.each { |company| 
    		5.times do |n|
        		nombre_producto = "Producto #{n+1}"
        		descripcion 	= "Descripcion del Producto #{n+1}"
        		stock 			= n * 15
    			company.products.create!(
        				name: nombre_producto,
        				description: descripcion,
        				stock: stock)
    		end
    	}
    end

end