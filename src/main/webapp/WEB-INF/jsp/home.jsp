<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/jumbotron-narrow.css">
    <link rel="stylesheet" type="text/css" href="/css/home.css">
    <link rel="stylesheet" type="text/css" href="/css/jquery.growl.css"/>
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/jquery.growl.js" type="text/javascript"></script>
</head>

<body>

<div class="container">
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li class="active" id="home"><a href="#">Home</a></li>
                <li id="logout"><a href="#">Logout</a></li>
            </ul>
        </nav>
        <h3 class="text-muted">Defensecoding.com</h3>
    </div>
    <div class="jumbotron">
			<h3>UserId ${userId}!</h3>
			<a
				href="https://tguimaraes.auth0.com/userinfo?access_token=<%=request.getParameter("access_token")%>">Get
				user_metadata</a>
			<a href="http://localhost:3000/portal/admin?access_token=<%=request.getParameter("access_token")%>">Load Service</a>
		    <p><h5>Access Token: <%=request.getParameter("access_token")%></h5></p>
		    
		    <p><h5>ID Token: <%=request.getParameter("id_token")%></h5></p>
	</div>
    
    
    
    
    
    <footer class="footer">
        <p> &copy; 2018 defensecoding.com</p>
    </footer>

</div>

<script type="text/javascript">
    $(function () {
        $.growl({title: "Welcome ${userId}", message: "Auth0 exercise - Solution Architect!"});
    });
    $("#logout").click(function(e) {
        e.preventDefault();
        $("#home").removeClass("active");
        $("#password-login").removeClass("active");
        $("#logout").addClass("active");
        // assumes we are not part of SSO so just logout of local session
        window.location = "${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}/logout";
    });
</script>

</body>
</html>