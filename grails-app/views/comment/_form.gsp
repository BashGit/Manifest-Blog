<%@ page import="blog.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'commenter', 'error')} required">
	<label for="commenter">
		<g:message code="comment.commenter.label" default="Commenter" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="commenter" required="" value="${commentInstance?.commenter}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="comment.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="1000" required="" value="${commentInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'entry', 'error')} required">
	<label for="entry">
		<g:message code="comment.entry.label" default="Entry" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entry" name="entry.id" from="${blog.BlogEntry.list()}" optionKey="id" required="" value="${commentInstance?.entry?.id}" class="many-to-one"/>

</div>

