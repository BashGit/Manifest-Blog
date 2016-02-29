<!DOCTYPE html>
<html>
	<body>
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
