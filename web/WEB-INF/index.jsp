<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>Digg</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" type="text/css" rel="stylesheet">
  </head>
  <body>

    <jsp:include page="fragment/navbar.jspf" />



  <c:if test="${not empty requestScope.discoveries}">
    <c:forEach var="discovery" items="${requestScope.discoveries}">
      <div class="container">
        <div class="row bs-callout bs-callout-primary">
          <div class="col col-md-1 col-sm-2">
            <!-- Kolumna głosowania -->
            <a href="${pageContext.request.contextPath}/vote?discovery_id=${discovery.id}&vote=VOTE_UP"
               class="btn btn-block btn-primary btn-success"><span class="glyphicon glyphicon-arrow-up"></span> </a>
            <div class="well well-sm centered"><c:out value="${discovery.upVote - discovery.downVote}"/></div>
            <a href="${pageContext.request.contextPath}/vote?discovery_id=${discovery.id}&vote=VOTE_DOWN"
            class="btn btn-block btn-primary btn-warning"><span class="glyphicon glyphicon-arrow-down"></span> </a>
          </div>
          <div class="col col-md-11 col-sm-10">
            <!-- Kolumna z treścią -->
            <h3 class="centered"><a href="<c:out value="${discovery.url}"/>"><c:out value="${discovery.name}"/></a> </h3>
            <h6><small>Dodane przez: <c:out value="${discovery.user.username}"/>,
            Dnia: <fmt:formatDate value="${discovery.timestamp}" pattern="dd/MM/YYYY"/> </small></h6>
            <p><c:out value="${discovery.description}"/></p>
            <a href="<c:out value="${discovery.url}" />" class="btn btn-default btn-xs">Przejdź do strony</a>
          </div>
        </div>
      </div>

    </c:forEach>


  </c:if>

    <jsp:include page="fragment/footer.jspf" />



  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

  </body>
</html>
