<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
table, th, td {
	border: 1px solid;
}
</style>
</head>
<body>
	<jsp:include page="home.html"></jsp:include>
	<sql:setDataSource var="db"
		driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
		url="jdbc:sqlserver://localhost:1433;instance=sqlexpress;databaseName=ShoppingDB;encrypt=true;trustServerCertificate=true;integratedSecurity=true;" />
	<sql:query dataSource="${db}"
		sql="select * from Products where product_id =?" var="rs">
		<sql:param>${param.ID }</sql:param>
	</sql:query>
	<table>
		<tr>
			<td>Product</td>
			<td>Price</td>
			<td>Quantity</td>
			<td>Amount</td>
		</tr>
		<c:forEach var="table" items="${rs.rows}" varStatus="row">
			<tr>
				<td><c:out value="${table.product_name}"></c:out></td>
				<td>$<c:out value="${table.product_price}"></c:out></td>
				<td>1</td>
				<td>$<c:out value="${table.product_price}"></c:out></td>
			</tr>
		</c:forEach>
	</table>
	<form method="post">
		<p>Customer mail</p>
		<div>
			<input type="text" name="mail">
		</div>
		<p>Discount code (if any)</p>
		<div>
			<input type="text" name="discount">
		</div>
		<p>Customer address</p>
		<div>
			<input type="text" name="address">
		</div>
		<div>
			<input type="submit" value="submit">
		</div>
	</form>

	<c:if test="${pageContext.request.method=='POST'}">

		<c:catch var="exception">
			<sql:update dataSource="${db }" var="updatedTable">
insert into Orders (user_mail,order_discount_code,order_address,product_id,amount_product,price_product) values (?,?,?,?,?,?)
<sql:param>${param.mail }</sql:param>
				<sql:param>${param.discount }</sql:param>
				<sql:param>${param.address }</sql:param>
				<sql:param>${param.ID }</sql:param>
				<sql:param>1</sql:param>
				<c:forEach var="table" items="${rs.rows}" varStatus="row">
					<sql:param>${table.product_price}</sql:param>
				</c:forEach>
			</sql:update>
			<c:if test="${updatedTable>=1}">
				<font size="5" color='green'> Congratulations ! Data inserted
					successfully.</font>
			</c:if>
		</c:catch>
		<c:if test="${exception!=null}">
			<c:out value="Unable to insert data in database." />
		</c:if>

	</c:if>

	<jsp:include page="footer.html"></jsp:include>
</body>
</html>