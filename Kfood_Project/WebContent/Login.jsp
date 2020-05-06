<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<title>AbsoluteAdmin - A Responsive Bootstrap 3 Admin Dashboard
	Template</title>
<meta name="keywords"
	content="HTML5 Bootstrap 3 Admin Template UI Theme" />
<meta name="description"
	content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
<meta name="author" content="AbsoluteAdmin">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Font CSS (Via CDN) -->
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/skin/default_skin/css/theme.css">

<!-- Admin Forms CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/admin-tools/admin-forms/css/admin-forms.css">

<!-- Favicon -->
<link rel="shortcut icon" href="assets/img/favicon.ico">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
   <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
   <![endif]-->
<script>
	function joinForm() {
		location.href = "JoinMember.jsp";
	}
</script>
</head>
<body class="external-page sb-l-c sb-r-c">

	<!-- Start: Main -->
	<div id="main" class="animated fadeIn">

		<!-- Start: Content-Wrapper -->
		<section id="content_wrapper">

			<!-- begin canvas animation bg -->
			<div id="canvas-wrapper">
				<canvas id="demo-canvas"></canvas>
			</div>

			<!-- Begin: Content -->
			<section id="content">

				<div class="admin-form theme-info" id="login1">

					<div class="row mb15 table-layout">

						<div class="col-xs-6 va-m pln">
							<a href="Main.jsp" title="Return to Dashboard"> <!--  <img src="assets/img/logos/logo_white.png" title="AdminDesigns Logo" class="img-responsive w250"> -->
							</a>
						</div>

						<div class="col-xs-6 text-right va-b pr5">
							<div class="login-links">
								<a href="Login.jsp" class="active" title="Sign In">로그인</a> <span
									class="text-white"> | </span> <a href="JoinMember.jsp" class=""
									title="Register">회원가입</a>
							</div>

						</div>

					</div>

					<div class="panel panel-info mt10 br-n">

						<div class="panel-heading heading-border bg-white">
							<span class="panel-title hidden"> <i class="fa fa-sign-in"></i>Register
							</span>
							<div class="section row mn">
								<div class="col-sm-4">
									<a href="https://www.facebook.com/" target="_blank"
										class="button btn-social facebook span-left mr5 btn-block">
										<span> <i class="fa fa-facebook"></i>
									</span>Facebook
									</a>
								</div>
								<div class="col-sm-4">
									<a href="https://twitter.com/" target="_blank"
										class="button btn-social twitter span-left mr5 btn-block">
										<span> <i class="fa fa-twitter"></i>
									</span>Twitter
									</a>
								</div>
								<div class="col-sm-4">
									<a href="https://www.google.co.kr/" target="_blank"
										class="button btn-social googleplus span-left btn-block">
										<span> <i class="fa fa-google-plus"></i>
									</span>Google+
									</a>
								</div>
							</div>
						</div>

						<!-- end .form-header section -->
						<div id="login">
							<form action="Login" method="post" id="loginForm">
								<div class="panel-body bg-light p30">
									<div class="row">
										<div class="col-sm-7 pr30">

											<div class="section row hidden">
												<div class="col-md-4">
													<a href="https://www.facebook.com/" target="_blank"
														class="button btn-social facebook span-left mr5 btn-block">
														<span> <i class="fa fa-facebook"></i>
													</span>Facebook
													</a>
												</div>
												<div class="col-md-4">
													<a href="https://twitter.com/" target="_blank"
														class="button btn-social twitter span-left mr5 btn-block">
														<span> <i class="fa fa-twitter"></i>
													</span>Twitter
													</a>
												</div>
												<div class="col-md-4">
													<a href="https://www.google.co.kr/" target="_blank"
														class="button btn-social googleplus span-left btn-block">
														<span> <i class="fa fa-google-plus"></i>
													</span>Google+
													</a>
												</div>
											</div>

											<div class="section">
												<label for="username"
													class="field-label text-muted fs18 mb10">아이디</label> <label
													for="username" class="field prepend-icon"> <input
													type="text" name="id" id="username" class="gui-input"
													placeholder="아이디"> <label for="username"
													class="field-icon"> <i class="fa fa-user"></i>
												</label>
												</label>
											</div>
											<!-- end section -->

											<div class="section">
												<label for="username"
													class="field-label text-muted fs18 mb10">비밀번호</label> <label
													for="password" class="field prepend-icon"> <input
													type="password" name="pw" id="password" class="gui-input"
													placeholder="비밀번호"> <label for="password"
													class="field-icon"> <i class="fa fa-lock"></i>
												</label>
												</label>
											</div>
											<!-- end section -->

										</div>
										<div class="col-sm-5 br-l br-grey pl30">
											<h3 class="mb25">환영합니다!</h3>
											<p class="mb15">
												<span class="fa fa-check text-success pr5"></span> 회원제로 운영하는
												다양한 한식집 !
											</p>
											<p class="mb15">
												<span class="fa fa-check text-success pr5"></span> 간단한 음식부터
												고급진 요리까지~
											</p>
											<p class="mb15">
												<span class="fa fa-check text-success pr5"></span> 맛 보시고 좋은
												평가 부탁 드려요.
											</p>
											<p class="mb15">
												<span class="fa fa-check text-success pr5"></span> 참고 ) 리뷰 안
												좋게 쓰시면 블랙! ~.~
											</p>
										</div>
									</div>
								</div>
								<!-- end .form-body section -->
								<div class="panel-footer clearfix p10 ph15">
									<button type="submit" onClick="submit()" class="button btn-primary mr10 pull-right">로그인</button>



									<!--      <button onclick = "joinForm()" class="button btn-primary mr10 pull-right" >회원가입</button> -->
								</div>
								<!-- end .form-footer section -->
							</form>
						</div>
					</div>
				</div>

			</section>
			<!-- End: Content -->

		</section>
		<!-- End: Content-Wrapper -->

	</div>
	<!-- End: Main -->

	<!-- BEGIN: PAGE SCRIPTS -->

	<!-- jQuery -->
	<script src="vendor/jquery/jquery-1.11.1.min.js"></script>
	<script src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

	<!-- CanvasBG Plugin(creates mousehover effect) -->
	<script src="vendor/plugins/canvasbg/canvasbg.js"></script>

	<!-- Theme Javascript -->
	<script src="assets/js/utility/utility.js"></script>
	<script src="assets/js/demo/demo.js"></script>
	<script src="assets/js/main.js"></script>

	<!-- Page Javascript -->
	<script type="text/javascript">
		jQuery(document).ready(function() {

			"use strict";

			// Init Theme Core
			Core.init();

			// Init Demo JS
			Demo.init();

			// Init CanvasBG and pass target starting location
			CanvasBG.init({
				Loc : {
					x : window.innerWidth / 2,
					y : window.innerHeight / 3.3
				},
			});


		});

		function submit(){
			console.log($(this));
		}

	</script>

	<!-- END: PAGE SCRIPTS -->

</body>
</html>
