class User < ActiveRecord::Base
	has_secure_password

	validates :name, presence: true, length: { maximum: 50 }
	validates :password, length: { minimum: 6 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
	                  length: { maximum: 100 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }

	before_save { 
		#
		# Since email is indexed for uniqueness and not all
		# database adapters use case-sensitive indices, force
		# the email property to lower-case before saving
		# 
		self.email = email.downcase
	}
	
end

