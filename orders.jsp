<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib   uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
  <style>
table, th, td {
  border: 1px solid;
}
</style>
</head>
<body>
<jsp:include page="home.html"></jsp:include>

<sql:setDataSource var="db" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
url="jdbc:sqlserver://localhost:1433;instance=sqlexpress;databaseName=ShoppingDB;encrypt=true;trustServerCertificate=true;integratedSecurity=true;"
/>
<sql:query dataSource="${db}" sql="select * from Orders" var="rs">
</sql:query>
<table>
<tr>
<td>Email</td>
<td>Order date</td>
<td>Discount code</td>
<td>Address</td>
<td>Product id</td>
<td>Amount</td>
<td>Price</td>
</tr>
<c:forEach var="table" items="${rs.rows}" varStatus="row">
<tr>
<td><c:out value="${table.user_mail}"></c:out></td>
<td><c:out value="${table.order_date}"></c:out></td>
<td><c:out value="${table.order_discount_code}"></c:out></td>
<td><c:out value="${table.order_address}"></c:out></td>
<td><c:out value="${table.product_id}"></c:out></td>
<td><c:out value="${table.amount_product}"></c:out></td>
<td><c:out value="${table.price_product}"></c:out></td>
</tr>
</c:forEach>
</table>
<jsp:include page="footer.html"></jsp:include>
</body>
</html>