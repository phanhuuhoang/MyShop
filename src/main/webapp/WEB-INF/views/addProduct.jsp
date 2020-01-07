<%@include file="/WEB-INF/views/template-admin/header.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div class="row" style="margin-top: 50px;">

		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div id="content">
				<form:form method="post" modelAttribute="productInfo" enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleInputEmail1">Name Product</label> 
						<form:input
							path="productName"
							type="text" class="form-control" aria-describedby="emailHelp"
							placeholder="Name Product"/>
							<form:errors path="productName" element="div" style="color:red"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Product Description</label> 
						<form:input
							path="productDescription"
							type="text" class="form-control" aria-describedby="emailHelp"
							placeholder="Product Description" />
							<form:errors path="productDescription" element="div" style="color:red"/>
					</div>
					<form:select class="form-control" path="categoryId">
						<c:forEach items="${listCategory}" var="itemCategory">
							<option value="${itemCategory.categoryId}">${itemCategory.categoryName}</option>
						</c:forEach>
					</form:select>
					
					<div class="form-group">
						<label for="exampleInputEmail1">Product Price</label> 
						<form:input
							path="productPrice"
							type="number" class="form-control" aria-describedby="emailHelp"
							placeholder="Product Price" />
							<form:errors path="productPrice" element="div" style="color:red"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Product Detail</label>
						<div></div>
						<form:textarea rows="5" cols="100" id="ckeditor" path="productDetail"></form:textarea>
						<form:errors path="productDetail" element="div" style="color:red"/>
					</div>
					<div class="form-group">
						<label for="exampleFormControlFile1">Choose photo</label> 
						<form:input
							type="file" class="form-control-file"
							id="exampleFormControlFile1" path="productImage"/>
							<form:errors path="productImage" element="div" style="color:red"/>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- End of Main Content -->

	<%@include file="/WEB-INF/views/template-admin/footer.jsp"%>