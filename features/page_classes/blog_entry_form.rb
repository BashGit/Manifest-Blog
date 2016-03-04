class Blog_Entry_Form
	include PageObject
	
	page_url 'http://localhost:8080/blog/blogEntry/create'
	
	text_field(:title, :name => 'title')
	text_area(:entry, :name => 'entry')
	button(:submit, :name => 'create')
	
	def complete_entry_form
		self.title = 'Hello World'
		self.entry = 'I like to write blog posts!' 
		self.submit
	end

end