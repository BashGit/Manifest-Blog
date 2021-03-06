<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<script: src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script:>
		<g:layoutHead/>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		
		<div class="navbar">
			<div class="navbar-inner">
				<div class="col-md-2 vertical-center"><a class="home h3" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></div>
				<sec:ifNotLoggedIn>
					<div class="col-md-3"></div>
				</sec:ifNotLoggedIn>
				<sec:ifAnyGranted roles="ROLE_USER">
					<div class="col-md-3"></div>
				</sec:ifAnyGranted>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<div class="col-md-3 vertical-center"><g:link class="create h3" controller="blogEntry" action="create">New Blog Entry</g:link></div>
				</sec:ifAllGranted>
				<div class="col-md-6"></div>
				<sec:ifNotLoggedIn>
					<div class="col-md-1 vertical-center"><a class="h3" href="${createLink(uri: '/login/auth')}"/>Login</a></div>
				</sec:ifNotLoggedIn>
				<sec:ifLoggedIn>
					<div class="col-md-1 vertical-center"><a id="logout" class="h3" href="${createLink(uri: '/logout')}"/>Logout</a></div>
				</sec:ifLoggedIn>
			</div>
		</div>
	</head>
	<body>
		
		<div class="container">
			<%-- <div id="grailsLogo" role="banner"><a href="http://www.manifestcorp.com"><asset:image src="Manifest_225x79.jpeg" alt="Grails"/></a></div> --%>
			<g:layoutBody/>
			<div class="footer" role="contentinfo"></div>
			<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		</div>
		
	</body>
	
	<footer>
		
	</footer>
</html>
