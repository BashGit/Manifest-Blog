
<%@ page import="blog.Comment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-comment" class="content scaffold-show" role="main">
			<h1>Comment for '${commentInstance.entry.title}'</h1>
			<ol class="property-list comment">
			
				<g:if test="${commentInstance?.commenter}">
				<li class="fieldcontain">
					<span id="commenter-label" class="property-label"></span>
					
						<span class="property-value" aria-labelledby="commenter-label"><g:fieldValue bean="${commentInstance}" field="commenter"/> said...</span>
					
				</li>
				</g:if>
			
				<g:if test="${commentInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${commentInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="comment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${commentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentInstance?.entry}">
				<li class="hidden fieldcontain">
					<span id="entry-label" class="property-label"><g:message code="comment.entry.label" default="Entry" /></span>
					
						<span class="property-value" aria-labelledby="entry-label"><g:link controller="blogEntry" action="show" id="${commentInstance?.entry?.id}">${commentInstance?.entry?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:commentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${commentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
