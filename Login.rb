require './Base.rb'

class Login < Base

	USERNAME_FIELD = { id: 'username'}
	PASSWORD_FIELD = { id: 'password'}
	FORM = { id: 'login' }
	ERROR_MESSAGE = { id: 'flash-messages' }

	def initialize(driver)
		super
		visit '/login'
	end

	def loginAs(username, password)
		type(USERNAME_FIELD, username)
		type(PASSWORD_FIELD, password)
		submit(FORM)
	end

	def errorDisplayed?
		isDisplayed?(ERROR_MESSAGE)
	end
end






