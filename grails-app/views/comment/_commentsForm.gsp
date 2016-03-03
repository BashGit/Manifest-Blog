<%@ page import="blog.Comment" %>

<g:if test="${blogEntryInstance != null}">
	<g:each in="${blogEntryInstance?.comment?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1: 1}}" var="c" status="i">
	    <ul id="comment${i}">
	    	<g:link controller="comment" action="show" id="${c.id}" class="commenter">${c.commenter}</g:link>
			said...</br>
			<span class="commentContent">${c.content}</span></br>
			on <g:formatDate format="dd-MM-yyyy hh:mm aa" date="${c.dateCreated}"/> </br>
			</br>
		</ul>
	</g:each>
</g:if>