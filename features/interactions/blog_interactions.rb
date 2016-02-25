def login 
	visit_page Login
	on_page(Login).login
end

def publish_new_post
	visit_page Blog_Entry_Form
	on_page(Blog_Entry_Form).complete_entry_form
end

def read_publish_response
	on_page(Entry_Created).response
end

def view_recent_posts
	visit_page(Recent_Blog_Posts)
	on_page(Recent_Blog_Posts).top_blog_post
end

def delete_test_post
	@browser.back
	@browser.button(:class => 'delete').click
	sleep 1
	@browser.alert.ok
end