<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Product List</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>Name</th>
			<th>Catgory</th>
			<th>Price</th>
			<th>Decription</th>
			<th>Status</th>
		</tr>
	</thead>
		<c:forEach items = "${productList}" var = "product">
		<tr>
			<td>${product.productName}</td>
			<td>${product.productCategory}</td>
			<td>${product.productPrice}</td>
			<td>${product.productDescription}</td>
			<td>${product.productStatus}</td>
		</tr>
		</c:forEach>
</table>
</body>
</html>

