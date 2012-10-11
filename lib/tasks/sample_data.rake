namespace :db do
    desc "Llenar BD con ejemplos"
    task populate: :environment do
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
        5.times do |n|
        	p_name = "Chancleta - #{n+1}"
        	p_stock = 10 * n
        	p_description = "Una Chancleta Voladora"
        	Product.create!(name: p_name,
        					stock: p_stock,
        					description: p_description)
        end 	
    end
end