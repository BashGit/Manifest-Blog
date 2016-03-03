<%@ page import="blog.Comment" %>

<h4>Comments</h4>
<g:formRemote name="addCommentForm" url="[resource:commentInstance, controller:'comment', action:'save']" >
	<fieldset class="form">
		<g:render template="/comment/form"/>
	</fieldset>
	<fieldset class="buttons">
		<g:submitToRemote id="addCommentButton" url="[controller: 'comment', action: 'save']" update="comments" value="${message(code: 'custom.button.createComment.label', default: '')}" />
	</fieldset>
</g:formRemote>

<script>
	sleep 5
	$("#addCommentButton").on('click', function(){
		if ($('#commenter').value? && $('#content').value?) {
			$('#commenter').val(null);
			$('#content').val(null);
		}
	});
</script>