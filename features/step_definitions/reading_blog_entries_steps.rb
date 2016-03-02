#Scenario View Recent Blog Posts
Given(/^my favorite blogger has been very active$/) do
	visit_page Recent_Blog_Posts
	expect(on_page(Recent_Blog_Posts).check_if_ten_posts_exist).to be_truthy
end

When(/^I visit my favorite blogger\'s blog$/) do
	visit_page Login
	on_page(Login).login_user
end

Then(/^I should see a summary of my favorite blogger\'s 10 most recent posts in reverse order$/) do 
	expect(on_page(Recent_Blog_Posts).recent_posts_are_descending).to be_truthy
end

#Scenario View A Blog Post
Given (/^I visit a blog of my favorite blogger$/) do
	visit_favorite_blogger
end

When (/^I pick a blog post$/) do
	select_favorite_blog_post
end

Then (/^I should see the blog post$/) do
	expect(get_newest_post_title).to eq(get_current_blog_title)
end

#Scenario Search for Blog Post
Given (/^I visit the blog for my most favorite blogger$/) do
	expect(false).to be_true
end

When (/^I search for a blog post$/) do
	expect(false).to be_true
end

Then (/^I should see posts with that value in the title$/) do
	expect(false).to be_true
end