Given(/^I am logged in as a blogger$/) do
	login
end

When(/^I publish a new blog post$/) do
	publish_new_post
end

Then(/^I am notified that the blog post was successfully added$/) do
	response = read_publish_response
	expect(response).to include 'Your post was successfully added'
end

And(/^the newly added blog post is at the top of the recent posts list$/) do
	expect(top_blog_post).to be most_recent_blog
end