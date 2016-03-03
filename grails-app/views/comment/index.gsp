
<%@ page import="blog.Comment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="list-comment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="commenter" title="${message(code: 'comment.commenter.label', default: 'Commenter')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'comment.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'comment.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="comment.entry.label" default="Entry" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commentInstanceList}" status="i" var="commentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commentInstance.id}">${fieldValue(bean: commentInstance, field: "commenter")}</g:link></td>
					
						<td>${fieldValue(bean: commentInstance, field: "content")}</td>
					
						<td><g:formatDate date="${commentInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: commentInstance, field: "entry")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
