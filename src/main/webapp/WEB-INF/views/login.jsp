<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Services Section -->
<section id="services">

	<br> <br>
	<div class="wrapper">
		<form class="form-signin" action="" class="was-validated" method="post">
			<h2 class="form-signin-heading">Đăn nhập</h2>
			<input type="text" class="form-control" name="username"
				placeholder="Tài khoản" required="" autofocus="" />
			<input
				type="password" class="form-control" name="pass"
				placeholder="Mật khẩu" required="" /> 
			<label class="checkbox">
				<input type="checkbox" value="remember-me" id="rememberMe"
				name="rememberMe"> Nhớ mật khẩu
			</label>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Đăng nhập</button>
		</form>
	</div>

</section>
<%@include file="/WEB-INF/views/template/nofooter.jsp"%>