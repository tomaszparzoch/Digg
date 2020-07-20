<%--
  Created by IntelliJ IDEA.
  User: Tomek
  Date: 27.04.2020
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Digg - Rejestracja</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" type="text/css" rel="stylesheet">
</head>
<body>

<jsp:include page="fragment/navbar.jspf" />


<div class="container">
    <div class="col-sm-6 col-md-4 col-md-offset-4">

        <form class="form-signin" action="register" method="post">
            <h2 class="form-signin-heading">Rejestracja</h2>
            <input name="inputEmail" type="email" class="form-control" placeholder="Email" required autofocus/>
            <input name="inputUsername" type="text" class="form-control" placeholder="Nazwa użytkownika" required autofocus/>
            <input name="inputPassword" type="password" class="form-control" placeholder="Hasło" required/>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Zarejestruj się</button>


        </form>
    </div>

</div> <!-- /container -->

<jsp:include page="fragment/footer.jspf" />



<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

</body>
</html>
