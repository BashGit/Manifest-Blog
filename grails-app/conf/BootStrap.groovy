import com.testapp.*;

class BootStrap {

    def init = { servletContext ->
		
		def adminRole = new Role(authority: 'ROLE_ADMIN', description: 'Blogger\'s Role').save()
		def userRole = new Role(authority: 'ROLE_USER', description: 'Users of the blog').save()
		
		def blogger = new User(username: 'blogger',password: 'blog').save()
		def blogUser = new User(username: 'user',password: 'password').save()
		
		UserRole.create blogger, adminRole
		UserRole.create blogUser, userRole
		
		UserRole.withSession {
			it.flush()
			it.clear()
			
		assert Role.count() == 2
		assert User.count() == 2
		assert UserRole.count() == 2
			
		}	
    }
	
    def destroy = {
    }
}
