Given(/^I visit the blog for my favorite blogger$/) do
	visit_favorite_blogger
end

When(/^I choose a blog post$/) do
	select_favorite_blog_post
end

@wip
Then(/^the url should contain information about the post$/) do
	blog_post_url = get_blog_post_url
	expect(blog_post_url).to eq 'http://localhost:8080/blog/blog-entry/131/TACOS-TACOS-TACOS/2016-02-25'
	#TODO change show to be entry title and number to be entry dateCreated
end
