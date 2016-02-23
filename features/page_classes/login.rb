class Login_Page
	include PageObject
	
	page_url "localhost:8080/blog"
	
	text_field(:username, :id => 'username')
	text_field(:password, :id => 'password')
	button(:submit, :name => 'submit')
	
	def login 
		self.username = 'user'
		self.password = 'user'
		self.submit
	end
end