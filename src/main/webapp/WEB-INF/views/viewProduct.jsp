<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Services Section -->
<section id="services">
	<div class="container-fluid">
		<div class="col-lg-12 col-lg-offset-2 text-center">
			<h1 class="section-heading">Chi tiết sản phẩm</h1>
			<p>Ở đây hiển thị thông tin chi tiết!</p>
			<hr class="divider my-4">
			<hr class="primary">
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<a href="${pageContext.request.contextPath}/resources/uploads/${product.productImage}">
					<img style="width: 400px; height: 400px;" src="<c:url value="/resources/uploads/${product.productImage}" />"/>
				</a>
			</div>
			<div class="col-md-5">
				<h3>Tên sản phẩm: ${product.productName}</h3>
				<p>Mô tả: ${product.productDescription}</p>
				<p>Còn hàng</p>
				<p>Giá: ${product.productPrice} VNĐ</p>
				<br>
				<br>
				<a class="btn btn-success" href="${pageContext.request.contextPath}/home/add-product-shopcart.html?id=${product.productId}"> Thêm vào giỏ hàng</a>
				<a class="btn btn-danger" href="${pageContext.request.contextPath}/home/buy-now.html?id=${product.productId}"> Mua ngay</a>
			</div>
		</div>
		<div class="row" style="display:flex;flex-wrap:wrap;justify-content: center;">
			<div class="col-md-1">
			</div >
			<div class="col-md-8" ><p style="font-size: 20px; font-style:inherit;">Chi tiết:</p>
			${product.productDetail}</div>
			<div class="col-md-1">
			</div>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/template/footer.jsp"%>