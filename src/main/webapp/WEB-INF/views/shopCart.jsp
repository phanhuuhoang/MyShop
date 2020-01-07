<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Services Section -->
<section id="services">
	<br> <br> <br>
	<!-- Thông báo lưu đơn hàng thành công -->
	<c:if test="${ThongBao != null}">
		<div style="text-align:center; justify-content: center; color: green; font-size: 20px;">${ThongBao} </div>
	</c:if>	
	<c:if test="${cart == null}">
		<div class="text-center">

			<h2>Không có sản phẩm nào trong giỏ hàng</h2>
			<a class="btn btn-success"
				href="${pageContext.request.contextPath}/home.html?">Tiếp tục mua hàng</a>
		</div>
	</c:if>
	<c:if test="${cart != null}">
		<div class="text-center" style="padding-bottom: 30px">
			<h2>Tất cả sản phẩm trong giỏ hàng</h2>

			<form method="post"
				action="${pageContext.request.contextPath}/home/update-order.html?">
				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>
							<th></th>
							<th>Hình ảnh</th>
							<th>Tên sản phẩm</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
						</tr>
					</thead>
					<!-- SHOW LIST PRODUCT -->

					<c:forEach items="${cart}" var="cartitem">
						<tr>
							<td><a class="btn btn-danger"
								href="${pageContext.request.contextPath}/home/delete-product-shopcart.html?id=${cartitem.product.productId}">Delete</a>
							</td>
							<td><a
								href="${pageContext.request.contextPath}/resources/uploads/${cartitem.product.productImage}">
									<img style="width: 300px; height: 300px;"
									src="<c:url value="/resources/uploads/${cartitem.product.productImage}" />" />
							</a></td>
							<td>${cartitem.product.productName}</td>
							<td>${cartitem.product.productPrice} VNĐ</td>
							<td><input name="quantity" type="number"
								value="${cartitem.quantity}" min="1" max="10" /></td>
							<td>${cartitem.amount} VNĐ</td>
						</tr>
					</c:forEach>
					<tr>
					<tr>
						<td colspan="3"></td>
						<td colspan="3">Sum:${Sum} VNĐ</td>
					</tr>
				</table>
				<input type="submit" value="Cập nhật giỏ hàng" class="btn btn-secondary">
				<a class="btn btn-info"
					href="${pageContext.request.contextPath}/home/send-order.html?">Gửi đơn</a> <a class="btn btn-success"
					href="${pageContext.request.contextPath}/home.html?">Tiếp tục mua hàng</a>
			</form>
		</div>
	</c:if>
</section>
<%@include file="/WEB-INF/views/template/nofooter.jsp"%>