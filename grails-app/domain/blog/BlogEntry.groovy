package blog

class BlogEntry {
	
	String title
	String entry
	Date dateCreated
	Date lastUpdated
	
	@Override String toString() {
		title
	}
	
    static constraints = {
		title(blank:false, nullable: false)
		entry(maxSize:10000, blank:false, nullable: false)
    }
}
