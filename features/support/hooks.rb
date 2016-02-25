require 'watir-webdriver'
require 'watir-webdriver/extensions/alerts'
require 'page-object'

include PageObject::PageFactory

Before do |scenario|
	@browser = Watir::Browser.new 'firefox'
end

After do |scenario|
	@browser.close
end
