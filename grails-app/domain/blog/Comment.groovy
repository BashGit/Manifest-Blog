package blog

class Comment {
	
	String commenter
	String content
	Date dateCreated
	
	static belongsTo = [entry: BlogEntry]
	
    static constraints = {
		commenter(blank:false)
		content(blank:false, maxSize:1000)
    }
}
