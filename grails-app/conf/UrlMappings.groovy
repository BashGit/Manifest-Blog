class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

		"/blog-entry/$id/$title?/$dateCreated" (controller:"blogEntry", action:"show")
		
        "/" (controller:"blogEntry", action:"index")
        "500"(view:'/error')
		
	}
}
