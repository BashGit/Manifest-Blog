package blog



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class CommentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	@Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comment.list(params), model:[commentInstanceCount: Comment.count()]
    }

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def show(Comment commentInstance) {
        respond commentInstance
    }
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def create() {
        respond new Comment(params)
    }

    @Transactional
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def save(Comment commentInstance) {
        if (commentInstance == null) {
            notFound()
            return
        }

        if (commentInstance.hasErrors()) {
            respond commentInstance.errors, view:'create'
            return
        }

        commentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
				redirect(controller:"Comment", action:"renderComments", params:[blogEntryInstanceId: commentInstance.entry.id])
            }
            '*' { respond commentInstance, [status: CREATED] }
        }
    }

	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def edit(Comment commentInstance) {
        respond commentInstance
    }

    @Transactional
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def update(Comment commentInstance) {
        if (commentInstance == null) {
            notFound()
            return
        }

        if (commentInstance.hasErrors()) {
            respond commentInstance.errors, view:'edit'
            return
        }

        commentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comment.label', default: 'Comment'), commentInstance.id])
                redirect commentInstance
            }
            '*'{ respond commentInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def delete(Comment commentInstance) {

        if (commentInstance == null) {
            notFound()
            return
        }

        commentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comment.label', default: 'Comment'), commentInstance.id])
                redirect controller: "blogEntry", action:"show", id:commentInstance.entry.id
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def renderComments() {
		def entryInstance = blog.BlogEntry.withCriteria{
			eq("id", Long.parseLong(params.blogEntryInstanceId))
		}[0]
		render(template:"commentsForm", model: [blogEntryInstance: entryInstance])
	}
}
