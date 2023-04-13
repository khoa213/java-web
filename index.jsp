<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<jsp:include page="home.html"></jsp:include>

<sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
url="jdbc:sqlserver://localhost:1433;instance=sqlexpress;databaseName=ShoppingDB;encrypt=true;trustServerCertificate=true;integratedSecurity=true;"
/>
<sql:query dataSource="${db}" var="rs">
select * from Products
</sql:query>
<table>
<%
    ArrayList<Integer> numList = new ArrayList<Integer>();
    numList.add(1);
    numList.add(2);
    numList.add(3);
    numList.add(4);
    numList.add(5);
    numList.add(6);
    numList.add(7);
    numList.add(8);
    numList.add(9);
    numList.add(10);
    request.setAttribute("numList", numList);
%>

<c:set var="tablewidth" value="3"></c:set>
<c:forEach var="table" items="${rs.rows}" varStatus="row">
<c:if test="${row.index % tablewidth == 0 }">
<tr>
</c:if>
<td>



<!--<c:set scope="application" var="ID " value="1"></c:set>

<c:out value="${ID }"></c:out>-->
<a href="product.jsp?id=${table.product_id }">
<div class=" text-center">
                    <img src=<c:out value="${table.product_img_source}"></c:out> alt="iPhone">
                    <p class="text-muted"><c:out value="${table.product_type}"></c:out></p>
                    <P class="text-primary"><c:out value="${table.product_name}"></c:out></P>
                    <p class="text-danger">$<c:out value="${table.product_price}"></c:out></p>
                </div>
                </a>
              </td>
  <c:if test="${row.index + 1 % tablewidth == 0 }">
  </tr>
  </c:if>
</c:forEach>
</table>
<jsp:include page="footer.html"></jsp:include>
</body>
</html>