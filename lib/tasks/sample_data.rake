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
        
    end
end