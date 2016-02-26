<%@ page import="blog.BlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'Blog Entry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			
				<div class="navbar">
					<div class="navbar-inner">
						<a class="home h3" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
						<g:link class="create h3" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
						<a class="h3" href="blog/logout"/>Logout</a>
					</div>
				</div>
			
				<div id="list-blogEntry" class="content scaffold-list" role="main">
					<div class="list">
						<g:each in="${blogEntryInstanceList}" status="i" var="blogEntryInstance">
					  		<div id="${i}" class="entry">
					   		<h2><g:link action="show" id="${blogEntryInstance.id}">${blogEntryInstance.title}</g:link></h2>
					   		<span class="entry-date">Date Created: ${blogEntryInstance.dateCreated}</span>
					   		<p>${blogEntryInstance.entry}</p>                
					  		</div>  
					 	</g:each>
					</div>
					<div class="pagination">
						<g:paginate total="${blogEntryInstanceCount ?: 0}" />
					</div>
				</div>
			
		</div>
	</body>
</html>
