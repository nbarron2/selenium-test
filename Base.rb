require 'selenium-webdriver'

class Base

	attr_reader :driver

	def initialize(driver)
		@driver = driver
	end

	def visit(path = '/')
		@driver.get(ENV['host'] + path)
	end

	def type(identifier, text)
		element = @driver.find_element(identifier)
		element.send_keys text
	end

	def submit(identifier)
		@driver.find_element(identifier).submit
	end

	def isDisplayed?(identifier)
		@driver.find_element(identifier).displayed?
		true
    	rescue Selenium::WebDriver::Error::NoSuchElementError
      		false
	end
end