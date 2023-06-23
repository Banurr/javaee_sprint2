<%@ page import="kz.bitlab.techorda.db.User" %><%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 23.06.2023
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<% User user = (User) request.getAttribute("adam");
%>
<h1 style="font-size: 55px; text-align: center;margin-top: 40px"><b>HELLO <%=user.getFullName()%></b></h1>
<h4 style="color : darkgray;text-align: center;margin-top: 10px">This is your profile page</h4>
</body>
</html>
