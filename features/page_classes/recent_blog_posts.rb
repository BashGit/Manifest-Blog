class Recent_Blog_Posts
	include PageObject
	
	page_url 'http://localhost:8080/blog/'
	
	div(:top_blog_post, :id => '0')
	div(:comments, :id => 'comments')
	
	def check_if_ten_posts_exist
		return browser.div(:id => 9)
	end
	
	def recent_posts_are_descending
		for i in 0..8 do
			newer_num = i.to_s
			older_num = (i + 1).to_s
			
			newer = DateTime.parse(browser.element(:xpath => "//div[@id="+newer_num+"]").span.text.sub(/Date Created: /, ''))
			older = DateTime.parse(browser.element(:xpath => "//div[@id="+older_num+"]").span.text.sub(/Date Created: /, ''))
			
			if(older > newer)
				return false
			end
			
		end
		return true
	end
end