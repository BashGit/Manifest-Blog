def login 
	visit_page Login
	on_page(Login).login
end

def publish_new_post
	visit_page Blog_Entry_Form
	on_page(Blog_Entry_Form).complete_entry_form
end