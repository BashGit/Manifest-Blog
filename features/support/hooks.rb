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

Before('@create_test_post') do |scenario|
	publish_new_post
end

After('@delete_test_post') do |scenario|
	delete_test_post
end
