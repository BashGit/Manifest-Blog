<%@ page import="blog.Comment" %>

<div>
	<g:if test="${blogEntryInstance != null}">
		<g:each in="${blogEntryInstance?.comment?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1: 1}}" var="c">
		    <ul id="${c.id}">
		    	<g:link controller="comment" action="show" id="${c.id}">${c.commenter}</g:link>
				said...</br>
				${c.content} </br>
				on ${c.dateCreated} </br>
				</br>
			</ul>
		</g:each>
	</g:if>
	<g:else>
		<g:each var="c" in="${allComments.reverse()}">
			<ul>
		    	<g:link controller="comment" action="show" id="${c.id}">${c.commenter}</g:link>
				said...</br>
				${c.content} </br>
				on ${c.dateCreated} </br>
				</br>
			</ul>
		</g:each>
	</g:else>
</div>