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
	visit_favorite_blogger
	select_favorite_blog_post
	@browser.button(:class => 'deleteBlogEntry').click
	sleep 1
	@browser.alert.ok
end

def visit_favorite_blogger
	visit_page Recent_Blog_Posts
end

def select_favorite_blog_post
	@browser.div(:id => '0').a.click
end

def find_comments
	on_page(Most_Recent_Blog_Post).comments
end

def add_comment
	on_page(Most_Recent_Blog_Post).add_comment
end

def get_top_comment
	on_page(Most_Recent_Blog_Post).get_top_comment
end

def delete_test_comment
	@browser.ul(:id => 'comment0').a(:class => 'commenter').click
	@browser.button(:class => 'delete').click
	sleep 1
	@browser.alert.ok
end

def get_newest_post_title
	visit_page Recent_Blog_Posts
	return @browser.div(:id => '0').h2.text
end

def get_current_blog_title
	select_favorite_blog_post
	@browser.h1.text
end

def search_for_hello_world_blog
	@browser.text_field.set('Hello World')
	@browser.send_keys :enter
end

def check_that_search_returned_hello_world
	@browser.h2.text.include? "Hello World"
end