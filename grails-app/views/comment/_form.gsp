<%@ page import="blog.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'commenter', 'error')} required">
	<label for="commenter">
		<g:message code="comment.commenter.label" default="Commenter" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="commenter" name="commenter" required="" value="${commentInstance?.commenter}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="comment.content.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea id="content" name="content" cols="40" rows="5" maxlength="1000" required="" value="${commentInstance?.content}"/>

</div>

<div class="hidden fieldcontain ${hasErrors(bean: commentInstance, field: 'entry', 'error')} required">
	<label for="entry">
		<g:message code="comment.entry.label" default="Entry" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${blogEntryInstance}">
		<g:textField id="entry" name="entry.id" value="${blogEntryInstance.id}"/>
	</g:if>
	<g:else>
		<g:textField id="entry" name="entry.id" value="${commentInstance.entry.id}"/>
	</g:else>
</div>