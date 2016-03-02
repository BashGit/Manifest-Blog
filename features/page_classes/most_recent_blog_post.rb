class Most_Recent_Blog_Post
	include PageObject
	
	div(:comments, :id => 'comments')
	text_field(:commenter, :id => 'commenter')
	text_area(:content, :id => 'content')
	button(:submit, :type => 'button')
	ul(:top_comment, :id => 'comment0')
	
	def add_comment
		self.commenter = 'Adele'
		self.content = 'Hello!'
		self.submit
	end
	
	def get_top_comment
		top_comment
	end
end