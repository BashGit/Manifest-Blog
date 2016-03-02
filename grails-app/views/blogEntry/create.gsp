<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'Blog Entry')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
		
			<div class="navbar">
				<div class="navbar-inner">
					<div class="col-md-2 vertical-center"><a class="home h3" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></div>
					<div class="col-md-3 vertical-center"><g:link class="create h3" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></div>
					<div class="col-md-6"></div>
					<div class="col-md-1 vertical-center"><a class="h3" href="blog/logout"/>Logout</a></div>
				</div>
			</div>
			<div id="create-blogEntry" class="content scaffold-create" role="main">
				<div role="form">
					<div class="text-center">
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<g:hasErrors bean="${blogEntryInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${blogEntryInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
						</g:hasErrors>
						<g:form url="[resource:blogEntryInstance, action:'save']" >
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
							<fieldset class="buttons">
								<button class="btn btn-primary" name="create" onClick="save" value="${message(code: 'default.button.create.label', default: 'Create')}">Create</button>
							</fieldset>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
