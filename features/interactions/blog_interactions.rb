def login_blogger 
	visit_page Login
	on_page(Login).login_blogger
end

def login_user
	visit_page Login	
	on_page(Login).login_user
end

def publish_new_post
	visit_page Blog_Entry_Form
	on_page(Blog_Entry_Form).complete_entry_form
end

def read_publish_response
	on_page(Entry_Created).response
end

def view_newest_post
	visit_page(Recent_Blog_Posts)
	on_page(Recent_Blog_Posts).top_blog_post
end

def delete_test_post
	@browser.back
	@browser.button(:class => 'delete').click
	sleep 1
	@browser.alert.ok
end
