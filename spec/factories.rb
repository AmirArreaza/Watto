FactoryGirl.define do
	factory :user do
		sequence(:id_number)		{ |n| "#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}"}
		sequence(:first_name)  	{ |n| "Nombre #{n}"}
    	sequence(:last_name) 	{ |n| "Apellido #{n}"}
    	sequence(:email)		{ |n| "Email_#{}{n}@email.com"}
    	password "foobar"
	end

end