#Scenario View Recent Blog Posts
Given(/^my favorite blogger has been very active$/) do
	visit_page Recent_Blog_Posts
	expect(on_page(Recent_Blog_Posts).check_for_ten_recent_posts).to eq(11) #one row is the title, entry, etc...
end

When(/^I visit the blog for my favorite blogger$/) do
	visit_page Login
	on_page(Login).login_user
end

Then(/^I should see a summary of my favorite blogger's 10 most recent posts in reverse order$/) do 
	expect(on_page(Recent_Blog_Posts).recent_posts_are_descending).to be_truthy
end