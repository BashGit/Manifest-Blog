#Given (/^I visit the blog for my favorite blogger$/) is in the reading blog entries file

#When (/^I choose a blog post$/) is in the searchability_steps file

Then (/^I should see comments left by other readers$/) do
	comments = find_comments
	expect(comments).not_to be_nil
end

Given (/^I am reading a blog post from my favorite blogger$/) do
	visit_favorite_blogger
	select_favorite_blog_post
end

When (/^I add my genius comment to the blog post$/) do
	add_comment
	sleep 1
end

Then (/^my genius comment is at the top of the blog post comments$/) do
	top_comment = get_top_comment
	expect(top_comment).to include('Adele said...')
	expect(top_comment).to include('Hello!')
	delete_test_comment
end