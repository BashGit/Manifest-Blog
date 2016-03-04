<%@ page import="blog.BlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'Blog Entry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="container">
			<div id="show-blogEntry" class="content scaffold-show" role="main">
				<g:if test="${blogEntryInstance?.title}">
					<h1><span id="blog-title" class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${blogEntryInstance}" field="title"/></span></h1>
				</g:if>
				<ol class="property-list blogEntry">
				
					<g:if test="${blogEntryInstance?.entry}">
					<li class="fieldcontain">
						<span id="entry-label" class="property-label"></span>
						
							<span class="property-value" aria-labelledby="entry-label"><pre style="background-color: white; border-color: #0099ff"><g:fieldValue bean="${blogEntryInstance}" field="entry"/></pre></span>
						
					</li>
					</g:if>
				
					<g:if test="${blogEntryInstance?.dateCreated}">
					<li class="fieldcontain">
						<span id="dateCreated-label" class="property-label"><g:message code="blogEntry.dateCreated.label" default="Date Created" /></span>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${blogEntryInstance?.dateCreated}" /></span>
						
					</li>
					</g:if>
				
					<g:if test="${blogEntryInstance?.lastUpdated}">
					<li class="fieldcontain">
						<span id="lastUpdated-label" class="property-label"><g:message code="blogEntry.lastUpdated.label" default="Last Updated" /></span>
						
							<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${blogEntryInstance?.lastUpdated}" /></span>
						
					</li>
					</g:if>
					
					<div id="addComment">
						<g:render template="/comment/addCommentForm"/>
					</div>
					
					<div id="comments">
						<g:render template="/comment/commentsForm"/>
					</div>
				
				</ol>
				<g:form url="[resource:blogEntryInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${blogEntryInstance}"><g:message code="custom.button.editBlogEntry.label" default="Edit" /></g:link>
						<g:actionSubmit class="deleteBlogEntry" action="delete" value="${message(code: 'custom.button.deleteBlogEntry.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
