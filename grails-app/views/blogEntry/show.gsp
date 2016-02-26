
<%@ page import="blog.BlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'Blog Entry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-blogEntry" class="content scaffold-show" role="main">
			<h1><g:message code="custom.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blogEntry">
			
				<g:if test="${blogEntryInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="blogEntry.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${blogEntryInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntryInstance?.entry}">
				<li class="fieldcontain">
					<span id="entry-label" class="property-label"><g:message code="blogEntry.entry.label" default="Entry" /></span>
					
						<span class="property-value" aria-labelledby="entry-label"><g:fieldValue bean="${blogEntryInstance}" field="entry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntryInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="blogEntry.comment.label" default="Comment" /></span>
					
						<g:each in="${blogEntryInstance.comment}" var="c">
						<span class="property-value" aria-labelledby="comment-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
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
			
			</ol>
			<g:form url="[resource:blogEntryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${blogEntryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
