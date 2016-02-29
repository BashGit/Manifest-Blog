Given(/^I visit the blog for my favorite blogger$/) do
	visit_favorite_blogger
end

When(/^I choose a blog post$/) do
	select_favorite_blog_post
end

Then(/^the url should contain information about the post$/) do
	actual_blog_post_url = get_blog_post_url
	#expected_url = calculate_expected_url
	#expect(actual_blog_post_url).to eq 'expected_url'
	expect(actual_blog_post_url).to eq 'http://localhost:8080/blog/blog-entry/1/Hello-World/2016-02-26'
end
