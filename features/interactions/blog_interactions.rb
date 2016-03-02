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

def visit_favorite_blogger
	visit_page Recent_Blog_Posts
end

def select_favorite_blog_post
	@browser.div(:id => '0').a.click
end

def get_blog_post_url
	@browser.url
end

def find_comments
	on_page(Most_Recent_Blog_Post).comments
end

def calculate_expected_url
	#expected_url = get_blog_post_url_beginning(actual_blog_post_url)
	expected_url = 'http://localhost:8080/'
	expected_url += 'blog/blog-entry/'
	expected_url += get_post_id + '/'
	expected_url += get_post_title + '/'
	expected_url += get_post_date
	#http://localhost:8080/blog/blog-entry/1/Hello-World/2016-02-26
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