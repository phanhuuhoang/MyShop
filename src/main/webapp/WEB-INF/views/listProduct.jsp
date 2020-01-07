<%@include file="/WEB-INF/views/template-admin/header.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div class="row" style="margin-top: 50px;">

		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form method="get">
				<select class="form-control" onchange="this.form.submit()"
					name="idcategory">
					<c:forEach items="${listCategory}" var="itemCategory">
						<c:if test="${idcategory == itemCategory.categoryId}">
							<option value="${itemCategory.categoryId}" selected="selected">${itemCategory.categoryName}</option>
						</c:if>
						<c:if test="${idcategory != itemCategory.categoryId}">
							<option value="${itemCategory.categoryId}">${itemCategory.categoryName}</option>
						</c:if>
					</c:forEach>
				</select>
			</form>

			<c:if test="${listProduct.size() > 0}">
				<h3 class="d-flex justify-content-center text-primary" style ="margin-top: 50px; margin-bottom: 50px;">Product
					list for this category have: ${listProduct.size()} Products</h3>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th>Image</th>
								<th>Name</th>
								<th>Price</th>
								<th>Decription</th>
								<th>###</th>
							</tr>
						</thead>
						<c:forEach items="${listProduct}" var="product">
							<tr>
								<td>1</td>
								<td><img class="card-img-top"
									src="<c:url value="/resources/uploads/${product.productImage}" />"
									style="width: 50px; height: 50px;" alt="${product.productName}"></td>
								<td>${product.productName}</td>
								<td>${product.productPrice}</td>
								<td>${product.productDescription}</td>
								<td>
									<a class="btn btn-primary text-white" href="${pageContext.request.contextPath}/admin/edit-product.html?id=${product.productId}">Edit</a> &nbsp&nbsp
									<a class="btn btn-danger text-white" href = "${pageContext.request.contextPath}/admin/delete-product.html?id=${product.productId}">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>

			<c:if test="${listProduct.size() == 0}">
				<h3
					class="d-flex justify-content-start d-flex justify-content-center text-danger" style ="margin-top: 50px; margin-bottom: 50px;">There
					are currently no products from this category</h3>
			</c:if>
		</div>

		<div class="col-md-2"></div>
	</div>
	<!-- End of Main Content -->

	<%@include file="/WEB-INF/views/template-admin/footer.jsp"%>