class Entry_Created
	include PageObject
	
	div(:response, :xpath => '//div[@class="message"]')
end