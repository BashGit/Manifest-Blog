<%@ page import="blog.BlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'BlogEntry')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="container">
	
			<div id="edit-blogEntry" class="content scaffold-edit" role="main">
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
						<g:form url="[resource:blogEntryInstance, action:'update']" method="PUT" >
							<g:hiddenField name="version" value="${blogEntryInstance?.version}" />
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
							<fieldset class="buttons">
								<button class="save btn btn-primary" onClick="update" value="${message(code: 'default.button.update.label', default: 'Update')}">Update</button>
							</fieldset>
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
