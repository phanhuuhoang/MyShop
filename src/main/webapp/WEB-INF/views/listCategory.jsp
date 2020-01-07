<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/WEB-INF/views/template-admin/header.jsp"%>

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div class="row" style="margin-top: 50px;">

		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div id="content">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
							<th scope="col">Name Category &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listCategory}" var="itemCategory">
							<c:if test="${not empty itemCategory}">
								<tr>
									<td>${itemCategory.categoryId}</td>
									<td>${itemCategory.categoryName}</td>
									<td><a
										href="${pageContext.request.contextPath}/admin/see-list-categories.html?id=${itemCategory.categoryId}"
										class="btn btn-danger">Delete</a>&nbsp<a
										href="${pageContext.request.contextPath}/admin/add-category.html?id=${itemCategory.categoryId}"
										class="btn btn-primary">Update</a></td>
								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- End of Main Content -->

	<%@include file="/WEB-INF/views/template-admin/footer.jsp"%>