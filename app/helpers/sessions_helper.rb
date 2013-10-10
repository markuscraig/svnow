module SessionsHelper

	def sign_in(user)
		# create a new token
		remember_token = User.new_remember_token
		
		# add the token to the cookie and set the expiration time
		#cookies[:remember_token] = { value: remember_token, expires: 5.days.from_now }
		cookies.permanent[:remember_token] = remember_token

		# encrypt the token and save it to the model
		user.update_attribute(:remember_token, User.encrypt(remember_token))

		self.current_user = user
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

end
