class User < ActiveRecord::Base
	has_secure_password validations: false
	has_many :campaigns

	validates_presence_of :email, :password
	validates :email, uniqueness: true
end
