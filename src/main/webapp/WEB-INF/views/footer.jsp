<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
	
	<!-- Google Fonts에서 Gowun Batang 폰트 불러오기 -->
<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
   rel="stylesheet">

<style>
	.liTeam{
		margin-bottom : 10px;
	}
	
	* {
   font-family: "Gowun Batang", serif;
   font-weight: 550;
   font-style: normal;
}

</style>
</head>

<body>
	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about" style="width: 350px;">
						<div class="header__logo">
							<a href="/"><img src="/resources/images/TKlogo.png" alt=""
								style="width: 60px; height: 80px;"></a> <span
								style="font-weight: 700; font-size: 25px; padding: 5px; margin-left: 20px;">
								떡잎 서점</span>
						</div>
						<ul>
							<li>TK Library</li>
							<li>Git: <span><a href="https://github.com/djadudwns12/TKLibraryStore.git" style="color:black;">github.com/djadudwns12/TKLibraryStore.git </a></span></li>
							<li>Phone: 02-2675-1750</li>
							
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6 style="margin-top:30px;">프로젝트 팀원</h6>
						<ul>
							<li class="liTeam">엄영준</li>
							<li class="liTeam">이아림</li>
							<li class="liTeam">박근영</li>
							<li class="liTeam">최미설</li>
							<li class="liTeam">한준형</li>
							<li class="liTeam">김가윤</li>
						</ul>
						<ul>
							<li class="liTeam">djadudwns12@naver.com</li>
							<li class="liTeam">ahrimbau@gmail.com </li>
							<li class="liTeam">pgyseven@naver.com</li>
							<li class="liTeam">miseol93@naver.com</li>
							<li class="liTeam">wnsgud6388@naver.com</li>
							<li class="liTeam">kgykgy1123@naver.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						
						<form action="#" style="margin-left: 50px; margin-top: 50px;">
							<input type="text" placeholder="Enter your mail" >
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social" style="margin-left: 50px;">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img
								src="${pageContext.request.contextPath}/resources/template/img/payment-item.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->
	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/main.js"></script>
</body>
</html>