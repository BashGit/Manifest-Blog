<%@ page import="blog.Comment" %>

<g:if test="${blogEntryInstance != null}">
	<g:each in="${blogEntryInstance?.comment?.sort{a,b -> (a.dateCreated > b.dateCreated) ? -1: 1}}" var="c" status="i">
	    <ul class="comment" id="comment${i}">
	    	<g:link controller="comment" action="edit" id="${c.id}" class="commenter">${c.commenter}</g:link>
			said...</br>
			<span class="commentContent">${c.content}</span></br>
			on <g:formatDate date="${c.dateCreated}"/> 
			<sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN">
				<g:form url="[resource:commentInstance, controller:'comment', action:'delete', id:c.id]" method="DELETE">
					<g:submitToRemote class="delete" url="[resource:commentInstance, controller:'comment', action:'delete', id:c.id]" method="DELETE" update="[success: 'comments']" value="${message(code: 'custom.button.deleteComment.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</sec:ifAnyGranted>
			</br>
			</br>
		</ul>
	</g:each>
</g:if>
