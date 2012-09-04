class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  	attr_accessible :id_number, :email, :first_name, :last_name, :password, :password_confirmation

	has_secure_password
	before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

	validates :first_name, 	presence: { message: "no puede estar en blanco" }, 
							length: { maximum: 100, message: "no debe tener mas de 100 caracteres" }

	validates :last_name, 	presence: { message: "no puede estar en blanco" }, 
							length: { maximum: 100, message: "no debe tener mas de 100 caracteres" }

	validates :id_number, 	presence: { message: "no puede estar en blanco" }, 
							length: { maximum: 9, message: "no debe tener mas de 9 caracteres" }, 
							uniqueness: { message: "esta cedula ya existe en el sistema"}

	validates :email, 	presence: { message: "no puede estar en blanco" }, 
						format: { with: VALID_EMAIL_REGEX, message: "es invalido" }, 
						uniqueness: { case_sensitive: false, message: "este email ya existe en el sistema" }

	validates :password, 	presence: { message: "no puede estar en blanco" }

	validates :password_confirmation, presence: { message: "no puede estar en blanco" }

	private

    	def create_remember_token
    		self.remember_token = SecureRandom.urlsafe_base64
    	end

end
