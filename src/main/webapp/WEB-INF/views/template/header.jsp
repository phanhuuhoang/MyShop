<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Cửa Hàng Thời Trang PH </title>

<!-- Font Awesome Icons <link href = "<c:url value = "/resources/vendor/fontawesome-free/css/all.min.cs"/>" rel="stylesheet" type="text/css">-->
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css" />"
	rel="stylesheet" type="text/css">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link
	href="<c:url value="/resources/vendor/magnific-popup/magnific-popup.css"/>"
	rel="stylesheet">

<!-- Theme CSS - Includes Bootstrap -->
<link href="<c:url value="/resources/css/creative.min.css"/>"
	rel="stylesheet">
	
<!-- Style CSS-->
<link href="<c:url value="/resources/css/style.css"/>"
	rel="stylesheet">

</head>
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-dark bg-dark"
		id="mainNav">
		<div class="container-fluid">
			<a class="navbar-brand js-scroll-trigger"
				href="<c:url value="/" />#page-top">Cửa Hàng Thời Trang PH </a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto my-2 my-lg-0">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="<c:url value="/" />#about">About</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="<c:url value="/" />#services">Products</a></li>
					<c:if test="${username == null}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="${pageContext.request.contextPath}/home/login.html?">
								Login </a></li>
					</c:if>
					<c:if test="${username != null}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown">${username} </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/home/logout.html?">Log out</a> <a
									class="dropdown-item" href="${pageContext.request.contextPath}/home/detailCus.html?">See detail</a>
							</div></li>
					</c:if>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="${pageContext.request.contextPath}/home/shop-cart.html?">Shop
							Cart</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="<c:url value="/" />#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
