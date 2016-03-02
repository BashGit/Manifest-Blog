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
