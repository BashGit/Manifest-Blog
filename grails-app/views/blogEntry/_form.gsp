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

<div class="fieldcontain ${hasErrors(bean: blogEntryInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="blogEntry.comment.label" default="Comment" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${blogEntryInstance?.comment?}" var="c">
    <li><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="comment" action="create" params="['blogEntry.id': blogEntryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link>
</li>
</ul>


</div>

