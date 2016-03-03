class Login
	include PageObject
	
	page_url "http://localhost:8080/blog/login/auth?format="
	
	text_field(:username, :id => 'username')
	text_field(:password, :id => 'password')
	button(:submit, :type => 'submit')
	
	def login_blogger 
		self.username = 'blogger'
		self.password = 'blog'
		self.submit
	end
	
	def login_user
		self.username = 'user'
		self.password = 'password'
		self.submit
	end
	
	def logout
		browser.element(:id => 'logout').click()
	end
end