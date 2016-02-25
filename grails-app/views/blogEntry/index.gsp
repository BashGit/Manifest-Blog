
<%@ page import="blog.BlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'Blog Entry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-blogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><a href="blog/logout"/>Logout</a></li>
			</ul>
		</div>
		<div id="list-blogEntry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'blogEntry.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="entry" title="${message(code: 'blogEntry.entry.label', default: 'Entry')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'blogEntry.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'blogEntry.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blogEntryInstanceList}" status="i" var="blogEntryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td id="${i}"><g:link action="show" id="${blogEntryInstance.id}">${fieldValue(bean: blogEntryInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: blogEntryInstance, field: "entry")}</td>
					
						<td><g:formatDate date="${blogEntryInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${blogEntryInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${blogEntryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
