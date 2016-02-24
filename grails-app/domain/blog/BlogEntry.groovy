package blog

class BlogEntry {
	
	String title
	String entry
	Date dateCreated
	Date lastUpdated

	
    static constraints = {
		title(blank:false, nullable: false)
		entry(maxSize:10000, blank:false, nullable: false)
    }
}
