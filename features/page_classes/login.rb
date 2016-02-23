class Login
	include PageObject
	
	page_url "http://localhost:8080/blog/login/auth?format="
	
	text_field(:username, :id => 'username')
	text_field(:password, :id => 'password')
	button(:submit, :type => 'submit')
	
	def login 
		self.username = 'blogger'
		self.password = 'blog'
		self.submit
	end
end