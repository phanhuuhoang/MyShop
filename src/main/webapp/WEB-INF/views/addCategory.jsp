<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/WEB-INF/views/template-admin/header.jsp"%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div class="row" style="margin-top: 50px;">

            <div class="col-md-2"></div>
            <div class="col-md-8">
	            <div id="content" >
			      	<form:form modelAttribute="categoryInfo" method="POST">
					  <div class="form-group">
					    <label for="exampleInputEmail1">Name Category</label>
					    <form:input path="categoryName" type="text" class="form-control" aria-describedby="emailHelp" placeholder="Name Category" />
					  	<form:errors path="categoryName" element="div" style="color:red"/>
					  </div>
					  <button type="submit" class="btn btn-primary">Add</button>
					</form:form>
	      		</div>
	      	</div>
 			<div class="col-md-2"></div>
      </div>
      <!-- End of Main Content -->
  
  <%@include file="/WEB-INF/views/template-admin/footer.jsp"%>
