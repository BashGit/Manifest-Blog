<%@ page import="blog.BlogEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'Blog Entry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="container">
			
				<div id="list-blogEntry" class="content scaffold-list" role="main">
					<div class="list">
					
						<fieldset class="form">
						    <g:form action="index" method="GET">
						        <div class="fieldcontain">
						            <label for="query">Search for blogs:</label>
						            <g:textField name="query" value="${params.query}" />
						        </div>
						    </g:form>
						</fieldset>
		
						<g:each in="${blogEntryInstanceList}" status="i" var="blogEntryInstance">
					  		<div id="${i}" class="entry">
					   		<h2><g:link action="show" params="[title:blogEntryInstance.title.replaceAll('\\s', '-'), 
					   			dateCreated:blogEntryInstance.dateCreated.format('yyy-MM-dd')]" id="${blogEntryInstance.id}">${blogEntryInstance.title}</g:link></h2>
					   		<span class="entry-date">Date Created: <g:formatDate date="${blogEntryInstance.dateCreated}"/></span>
					   		<p><pre class="summary">${blogEntryInstance.entry}</pre></p>               
					  		</div>  
					  		<hr>
					 	</g:each>
					</div>
					<div class="pagination">
						<g:if test="${!params.query}">
							<g:paginate total="${blogEntryInstanceCount ?: 0}" />
						</g:if>
						<g:else>
							<g:paginate total="${blogEntryInstanceCount ?: 0}" params="[query:params.query]" />
						</g:else>	
					</div>
				</div>
			
		</div>
		
	<script>
		$(document).ready(function() {
			$(".summary").dotdotdot({
				/*	The text to add as ellipsis. */
				ellipsis	: '... ',
		 
				/*	How to cut off the text/html: 'word'/'letter'/'children' */
				wrap		: 'word',
		 
				/*	Wrap-option fallback to 'letter' for long words */
				fallbackToLetter: true,
		 
				/*	jQuery-selector for the element to keep and put after the ellipsis. */
				after		: null,
		 
				/*	Whether to update the ellipsis: true/'window' */
				watch		: false,
			
				/*	Optionally set a max-height, can be a number or function.
					If null, the height will be measured. */
				height		: 100,
		 
				/*	Deviation for the height-option. */
				tolerance	: 0,
		 
				/*	Callback function that is fired after the ellipsis is added,
					receives two parameters: isTruncated(boolean), orgContent(string). */
				callback	: function( isTruncated, orgContent ) {},
		 
				lastCharacter	: {
		 
					/*	Remove these characters from the end of the truncated text. */
					remove		: [ ' ', ',', ';', '.', '!', '?' ],
		 
					/*	Don't add an ellipsis if this array contains 
						the last character of the truncated text. */
					noEllipsis	: []
				}
			});
		});
	</script>
	</body>
</html>
