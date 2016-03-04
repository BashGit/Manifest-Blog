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

Before('@login_blogger') do |scenario|
	login_blogger
end

After('@logout') do |scenario|
	visit_page Login
	on_page(Login).logout
end

Before('@create_test_post') do |scenario|
	publish_new_post
end

After('@delete_test_post') do |scenario|
	delete_test_post 
end

Before('@create_ten_test_posts') do |scenario|
	(0..9).each do |i|
		publish_new_post
	end
end

After('@delete_ten_test_posts') do |scenario|
	(0..9).each do |i|
		delete_test_post
	end
end