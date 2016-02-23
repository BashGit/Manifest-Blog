def login 
	visit_page Login
	on_page(Login).login
end

def complete_entry_form
	
end

def publish_new_post
	on_page(Blog_Entry_Form).complete_entry_form
end