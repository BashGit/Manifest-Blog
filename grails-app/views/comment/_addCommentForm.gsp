<%@ page import="blog.Comment" %>

<h4>Comments</h4>
<g:form name="addCommentForm" url="[resource:commentInstance, controller:'comment', action:'save']" >
	<fieldset class="form">
		<g:render template="/comment/form"/>
	</fieldset>
	<fieldset class="buttons">
		<g:submitToRemote id="addCommentButton" url="[controller: 'comment', action: 'save']" update="comments" value="${message(code: 'custom.button.createComment.label', default: '')}" />
	</fieldset>
</g:form>

<script>
	$("#addCommentButton").on('click', function(){
		if (document.getElementById('commenter').value != null && document.getElementById('content') != null) {
			$('#commenter').val('');
			$('#content').val('');
		}
	});
</script>