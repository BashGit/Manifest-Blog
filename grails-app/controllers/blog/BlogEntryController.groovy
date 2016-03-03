package blog

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class BlogEntryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		if(!params.query) {
			respond BlogEntry.list(params), model:[blogEntryInstanceCount: BlogEntry.count()]
		}else {
			def results = BlogEntry.createCriteria().list (params) {
					ilike("title", "%${params.query}%")
			}
			if(results.totalCount > 10) {
				respond results, model:[blogEntryInstanceCount: BlogEntry.count()]
			}else {
				respond results
			}
		}		
    }

    def show(BlogEntry blogEntryInstance) {
        respond blogEntryInstance
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        respond new BlogEntry(params)
    }

    @Transactional
	@Secured(['ROLE_ADMIN'])
    def save(BlogEntry blogEntryInstance) {
        if (blogEntryInstance == null) {
            notFound()
            return
        }

        if (blogEntryInstance.hasErrors()) {
            respond blogEntryInstance.errors, view:'create'
            return
        }

        blogEntryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'custom.created.message', args: [message(code: 'blogEntry.label', default: ''), blogEntryInstance.title])
                redirect blogEntryInstance
            }
            '*' { respond blogEntryInstance, [status: CREATED] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    def edit(BlogEntry blogEntryInstance) {
        respond blogEntryInstance
    }

    @Transactional
	@Secured(['ROLE_ADMIN'])
    def update(BlogEntry blogEntryInstance) {
        if (blogEntryInstance == null) {
            notFound()
            return
        }

        if (blogEntryInstance.hasErrors()) {
            respond blogEntryInstance.errors, view:'edit'
            return
        }

        blogEntryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BlogEntry.label', default: ''), blogEntryInstance.title])
                redirect blogEntryInstance
            }
            '*'{ respond blogEntryInstance, [status: OK] }
        }
    }

    @Transactional
	@Secured(['ROLE_ADMIN'])
    def delete(BlogEntry blogEntryInstance) {

        if (blogEntryInstance == null) {
            notFound()
            return
        }

        blogEntryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BlogEntry.label', default: ''), blogEntryInstance.title])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'blogEntry.label', default: ''), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
