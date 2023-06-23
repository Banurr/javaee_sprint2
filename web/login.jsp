<%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 23.06.2023
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
  <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<%
    String error = request.getAttribute("error").toString();
    if(error.equals("error"))
    {
%>
<div class="alert alert-danger alert-dismissible fade show mt-3" role="alert" style="max-width: 45rem;margin : auto auto">
  Incorrect <strong>email</strong> or <strong>password</strong> !
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<%}%>
<div class="card mb-3 mt-4" style="max-height : 20rem ;max-width: 45rem;margin : auto auto">
  <div class="card-header">Login Page</div>
  <div class="card-body">
    <form action="/login" method="post">
      <div class="form-group">
        <label for="email" class="col-form-label">Email:</label>
        <input type="email" class="form-control" id="email" name="email">
      </div>
      <div class="form-group">
        <label for="password" class="col-form-label">Password:</label>
        <input type="password" class="form-control" id="password" name="password">
      </div>
      <button class="btn btn-success mt-2">Log in</button>
    </form>
  </div>
</div>
</body>
</html>
