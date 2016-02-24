<%@ page import="blog.BlogEntry" %>



<div class="fieldcontain ${hasErrors(bean: blogEntryInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="blogEntry.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${blogEntryInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogEntryInstance, field: 'entry', 'error')} required">
	<label for="entry">
		<g:message code="blogEntry.entry.label" default="Entry" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="entry" cols="40" rows="5" maxlength="10000" required="" value="${blogEntryInstance?.entry}"/>

</div>

