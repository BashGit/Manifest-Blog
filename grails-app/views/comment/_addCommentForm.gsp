<%@ page import="blog.Comment" %>

<h4>Comments</h4>
<g:form url="[resource:commentInstance, controller:'comment', action:'save']" >
	<fieldset class="form">
		<g:render template="/comment/form"/>
	</fieldset>
	<fieldset class="buttons">
		<g:submitToRemote url="[controller: 'comment', action: 'save']" update="comments" value="${message(code: 'custom.button.createComment.label', default: '')}" />
	</fieldset>
</g:form>