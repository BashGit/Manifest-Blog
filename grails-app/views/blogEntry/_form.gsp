<%@ page import="blog.BlogEntry" %>



<div class="fieldcontain ${hasErrors(bean: blogEntryInstance, field: 'title', 'error')} required">
	
	<div class="row form-group">
		<div class="col-sm-4 text-right"><b>Title:</b></div>
		<div class="row col-sm-4">
			<input class="form-control" name="title" required="" value="${blogEntryInstance?.title}"/>
		</div>
		<div class="col-sm-4"></div>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: blogEntryInstance, field: 'entry', 'error')} required">
	
	<div class="row form-group">
		<div class="col-sm-3 text-right"><b>Entry:</b></div>
		<div class="row col-sm-6">
			<textArea class="form-control" name="entry"rows="10" maxlength="10000" required="">${blogEntryInstance?.entry}</textArea>
		</div>
		<div class="col-sm-3"></div>
	</div>

</div>

<%--DELETE AFTER ADDING COMMENTS TO SHOW
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


</div>--%>