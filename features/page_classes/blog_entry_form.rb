class Blog_Entry_Form
	include PageObject
	
	text_field(:title, :id => 'title')
	text_area(:entry, :id => 'entry')
	button(:submit, :name => 'submit')
	
def complete_entry_form
	self.title = 'Top 10 Reasons why I\'m the Smartest Blogger Ever!'
	self.entry = 'It\'s a secret. I\'m not telling why.' 
	self.submit
	end
end