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
        
        Address.create!(
        	address_name: "Venezuela",
        	location_type: "Country"
        )

        Address.create!(
        	address_name: "EEUU",
        	location_type: "Country"
        )

        Address.create!(
        	address_name: "India",
        	location_type: "Country"
        )

        Address.create!(
        	address_name: "Distrito Capital",
        	location_type: "State",
        	belong_address: 1
        )
        Address.create!(
        	address_name: "Miranda",
        	location_type: "State",
        	belong_address: 1
        )
        Address.create!(
        	address_name: "Zulia",
        	location_type: "State",
        	belong_address: 1
        )
    end
end