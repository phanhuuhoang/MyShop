<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/template/homeHeader.jsp"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style = "clear: left;"></div>
<!-- Services Section -->
<section id="services">
	<div class="container-fluid" >
		<div class="col-lg-12 col-lg-offset-2 text-center" >
			<h1 class="section-heading">Tất cả sản phẩm cửa hàng</h1>
			<hr class="divider my-4">
			<p>Tất cả sản phẩm đang bán</p>
			<hr class="primary">
			<%-- <c:if test="${listProduct.size() > 0}">
				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Image</th>
							<th>Name</th>
							<th>Price</th>
							<th>Status</th>
							<th>View Detail</th>
						</tr>
					</thead>
					<!-- SHOW LIST PRODUCT -->
					<c:forEach items="${listProduct}" var="product">
						<tr>
							<td>##${index = index + 1}</td>
							<td>
							<img style="width: 300px; height: 300px;" src="<c:url value="/resources/uploads/${product.productImage}"/>" />
							</td>
							<td>${product.productName}</td>
							<td>${product.productPrice}</td>
							<td>Active</td>
							<td><a
								href="${pageContext.request.contextPath}/home/view-detail-product.html?id=${product.productId}">View</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if> --%>
			<div style="display:flex;flex-wrap:wrap;justify-content: center;">
			<c:if test="${listProduct.size() > 0}">
				<c:forEach items="${listProduct}" var="product">
					<div style="width: 400px; height: 550px;float: left;margin:10px;" class="product">
					 <a href="${pageContext.request.contextPath}/home/view-detail-product.html?id=${product.productId}">
						<img style="width: 380px; height: 430px;" src="<c:url value="/resources/uploads/${product.productImage}"/>"/>
					</a>
						<p>${product.productName}</p>
						<p>${product.productPrice} VNĐ</p>
						<div> <a class="btn btn-danger" href="${pageContext.request.contextPath}/home/add-product-shopcart.html?id=${product.productId}">Mua ngay</a> 
						<a class="btn btn-info" href="${pageContext.request.contextPath}/home/view-detail-product.html?id=${product.productId}">Chi tiết</a> </div>
						
					</div>
					
				</c:forEach>
			</c:if>
			</div>
			<div style="clear: left;"> </div>		
		</div>
		
	</div> 

	

</section>



<!-- Contact Section -->
<%@include file="/WEB-INF/views/template/footer.jsp"%>