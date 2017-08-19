require './Base.rb'
require './Login.rb'
require 'rspec'
require 'rspec/expectations'

class LoginSpec
	include RSpec::Matchers

	RSpec.configure do |c|
		c.before do
			@chromeDriver = Selenium::WebDriver.for :chrome
			ENV['host'] = 'http://localhost:9292'
		end
		c.after do
			@chromeDriver.quit
		end
	end

	RSpec.describe Login do
		context "with and invalid username/password" do
			it "displays an error message" do
				loginPage = Login.new(@chromeDriver)
				loginPage.loginAs('Nicholas', 'Nicholas')
				expect(loginPage.errorDisplayed?).to eql(true)
			end
		end
	end
end