# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  id_number       :integer
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    attr_accessible :id_number, :email, :first_name, :last_name, :password, :password_confirmation
    cattr_accessor :current_user
    
    has_secure_password
    has_many :companies
    has_many :reservations
    has_many :products, :through => :reservations, :dependent => :destroy

    before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

    after_save :clear_password

    validates :first_name, 	presence: { message: "no puede estar en blanco" },
        length: { maximum: 100, message: "no debe tener mas de 100 caracteres" }

    validates :last_name, 	presence: { message: "no puede estar en blanco" }, 
        length: { maximum: 100, message: "no debe tener mas de 100 caracteres" }

    validates :id_number, 	presence: { message: "no puede estar en blanco" }, 
        length: { maximum: 9, message: "no debe tener mas de 9 caracteres" }, 
        uniqueness: { message: "esta cedula ya existe en el sistema"}

    validates :email, 	presence: { message: "no puede estar en blanco" }, 
        format: { with: VALID_EMAIL_REGEX, message: "es invalido" }, 
        uniqueness: { case_sensitive: false, message: "ya existe en el sistema" }

    validates :password, 	presence: { message: "no puede estar en blanco" },  :on => :save

    validates :password_confirmation, presence: { message: "no puede estar en blanco" }, :on => :save

    private

        def create_remember_token
            self.remember_token = SecureRandom.urlsafe_base64
        end

        def clear_password
            self.password = nil
        end
end