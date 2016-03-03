#Given(/^I visit the blog for my favorite blogger$/) used in reading feature

When(/^I choose a blog post$/) do
	select_favorite_blog_post
end

Then(/^the url should contain information about the post$/) do
	expect(@browser.url).to match (/http:\/\/localhost:8080\/blog\/blog-entry\/[0-9]+\/Hello-World\/[0-9]+-[0-9]+-[0-9]+$/)
end
