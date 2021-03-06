Given(/^I am logged in as a blogger$/) do
	login_blogger
end

When(/^I publish a new blog post$/) do
	publish_new_post
end

Then(/^I am notified that the blog post was successfully added$/) do
	response = read_publish_response
	expect(response).to include 'success'
end

And(/^the newly added blog post is at the top of the recent posts list$/) do
	most_recent_blog_post = view_newest_post
	expect(most_recent_blog_post).to include 'Hello World'
end