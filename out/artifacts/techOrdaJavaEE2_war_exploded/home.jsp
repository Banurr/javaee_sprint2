<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.db.Items" %>
<%@ page import="java.util.concurrent.atomic.AtomicReferenceArray" %><%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 23.06.2023
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<h1 style="font-size: 55px; text-align: center;margin-top: 40px"><b>Welcome to BITLAB SHOP</b></h1>
<h4 style="color : darkgray;text-align: center;margin-top: 10px">Electronic devices with high quality and service</h4>
<form method="get" action="/">
    <div class="dropdown" style="margin-left: 255px;margin-top: 90px;margin-bottom: 40px">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Sort By
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="/?sort=pu">Price Ascending</a>
            <a class="dropdown-item" href="/?sort=pd">Price Descending</a>
        </div>
    </div>
</form>


<div style="display:grid;grid-template-columns: repeat(3,1fr);grid-gap: 30px 10px;grid-auto-flow: row;margin: auto auto;width: 70%;justify-items: center;
  align-items: center;">
 <% ArrayList<Items> items = (ArrayList<Items>) request.getAttribute("zat");
    for(Items i : items)
    {
 %>
    <div class="card mb-3" style="width: 18rem;text-align: center;height:22rem">
        <div class="card-header" style="font-size: 25px"><%=i.getName()%></div>
        <div class="card-body" style="text-align: center">
            <h4 class="card-title" style="color : seagreen;">$<%=i.getPrice()%></h4>
            <p class="card-text mt-5" style="width:50%;margin : auto auto;font-size: 20px"><%=i.getDescription()%></p>
            <button class="btn btn-success btn-block mt-5" style="bottom: 20px">Buy now</button>
        </div>
    </div>
    <%}%>
</div>

</body>
</html>
