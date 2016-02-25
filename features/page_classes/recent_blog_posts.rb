class Recent_Blog_Posts
	include PageObject
	
	page_url 'http://localhost:8080/blog/'
	
	cell(:top_blog_post, :id => '0')
end