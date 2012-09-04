require 'spec_helper'

describe User do

	before do 
		@user = User.new(first_name: "Example", last_name: "User", id_number: 1456258, email: "user@example.com", password: "TestTest", password_confirmation: "TestTest")
	end

	subject { @user }

	it { should be_valid }

	describe "Agregar usuario valido" do
    	before do
      		@user.save
    	end
    	it { should be_valid }
  	end	

	describe "Cuando el nombre no esta presente" do
    	before { @user.first_name = " " }
    	it { should_not be_valid }
  	end

  	describe "Cuando el apellido no esta presente" do
    	before { @user.last_name = " " }
    	it { should_not be_valid }
  	end

  	describe "Cuando la cedula no esta presente" do
    	before { @user.id_number = " " }
    	it { should_not be_valid }
  	end

  	describe "Cuando la cedula excede el numero de caracteres" do
    	before { @user.id_number = "5" * 10 }
    	it { should_not be_valid }
  	end

  	describe "Cuando el password no tiene la cantidad de caracteres necesarios" do
    	before { @user.password = "d" * 3 }
    	it { should_not be_valid }
  	end

  	describe "Cuando el password excede la cantidad de caracteres necesarios" do
    	before { @user.password = "sd" * 30 }
    	it { should_not be_valid }
  	end

    describe "Cuando la confirmacion del email no coincide" do
        before { @user.password_confirmation = "distinto" }
        it {should_not be_valid} 
    end

    describe "Cuando el formato del email es invalido" do
        it "Debe ser invalido" do
            addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                        foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |invalid_address|
                @user.email = invalid_address
                @user.should_not be_valid
            end
        end
    end

    describe "Cuando el formato del email es valido" do
        it "Debe ser valido" do
            addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
            addresses.each do |invalid_address|
                @user.email = invalid_address
                @user.should be_valid
            end
        end
    end    

end
