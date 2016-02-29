class Recent_Blog_Posts
	include PageObject
	
	page_url 'http://localhost:8080/blog/'
	
	div(:top_blog_post, :id => '0')
	div(:comments, :id => 'comments')
	
	def check_for_ten_recent_posts
		return browser.table.rows.length
	end
	
	def recent_posts_are_descending
		for i in 1..9
			#puts DateTime.parse(browser.table.tr(:index => i).cell(:index => 2).text)
			newer = DateTime.parse(browser.table.tr(:index => i).cell(:index => 2).text)
			older = DateTime.parse(browser.table.tr(:index => (i + 1)).cell(:index => 2).text)
			if(older > newer)
				return false
			end
		end
		return true
	end
end