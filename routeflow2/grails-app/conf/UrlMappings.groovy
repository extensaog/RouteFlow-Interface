class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {.
				// apply constraints here
			}
		}

		"/"(controller:"interface", action:"index")
		"500"(view:'/error')
	}
}
