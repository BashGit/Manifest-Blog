<!DOCTYPE html>
<html>
	<body>

		<%--<div class="navbar">
			<div class="navbar-inner">
				<div class="col-md-2 vertical-center"><a class="home h3" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></div>
				<div class="col-md-3 vertical-center"><g:link class="create h3" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></div>
				<div class="col-md-6"></div>
				<div class="col-md-1 vertical-center"><a class="h3" href="blog/logout"/>Logout</a></div>
			</div>
		</div>--%>
		
		<div id="create-comment" class="content scaffold-create" role="main">
			<g:hasErrors bean="${commentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${commentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:commentInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'custom.button.createComment.label', default: '')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
