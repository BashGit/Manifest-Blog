import com.testapp.*;

class BootStrap {

    def init = { servletContext ->
		
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN', description: 'Blogger\'s Role').save(failOnError: true)
		def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER', description: 'Users of the blog').save(failOnError: true)
		
		def blogger = User.findByUsername('blogger') ?: new User(username: 'blogger', password: 'blog', enabled: true).save(failOnError: true)
		
		if(!blogger.authorities.contains(adminRole)) {
			UserRole.create blogger, adminRole
		}
		
		def blogUser = User.findByUsername('user') ?: new User(username: 'user', password: 'password', enabled: true).save(failOnError: true)
		
		if(!blogUser.authorities.contains(userRole)) {
			UserRole.create blogUser, userRole
		}
		
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
