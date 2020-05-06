<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font CSS (Via CDN) -->
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

<!-- Admin Forms CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/admin-tools/admin-forms/css/admin-forms.css">

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/skin/default_skin/css/theme.css">

<!-- Favicon -->
<link rel="shortcut icon" href="assets/img/favicon.ico">


<script>
	function logout() {
		location.href = "Logout";
	}
</script>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/63b21adac5.js"
	crossorigin="anonymous"></script>

<style>
.mw40 {
	max-width: 200px !important;
}

.col-centered {
	float: none;
	margin: 0 auto;
	text-align: center;
}

table.tc-checkbox-1 tbody td:first-child, table.tc-checkbox-2 tbody td:nth-child(2),
	table.tc-checkbox-3 tbody td:nth-child(3), table.tc-checkbox-last tbody td:last-child
	{
	text-align: inherit;
	padding: 11px 20px;
}

.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	padding: 9px 20px;
}
</style>

</head>
<body>
	<section id="content" class="table-layout">
		<form action="MemberList" method="post"
			enctype="multipart/form-data">
			<!-- begin: .tray-center -->
			<div class="tray tray-center" style="height: 1044px;">

				<div class="panel mb25 mt5">
					<div class="panel-heading">
						<div class="col-md-10">
							<h3>회원목록 조회</h3>
						</div>
					</div>
					<div class="panel-menu p12 admin-form theme-primary">
						<div class="row">
							<div class="col-md-3">
								<div>
									<button type="button" onclick="location.href='Main.jsp'"
										class="btn active btn-default btn-block">메인페이지</button>
								</div>
							</div>
								<div class="col-md-3">
									<div>
										<button type="button"
											onclick="location.href='Registration.jsp'"
											class="btn active btn-default btn-block">상품 등록</button>
									</div>
								</div>
							<div class="col-md-3">
								<div>
									<button type="button"
										onclick="location.href='ProductListPaging'"
										class="btn active btn-default btn-block">상품 목록 조회</button>
								</div>
							</div>
							<div class="col-md-3">
								<div>
									<button type="button" onclick="logout()"
										class="btn active btn-default btn-block">로그아웃</button>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body pn">
						<div class="table-responsive">
							<table class="table admin-form theme-warning tc-checkbox-1 fs13">
									<thead>
										<tr class="bg-light">
											<th>아이디</th>
											<th>이름</th>
											<th>휴대폰 번호</th>
											<th>이메일</th>
											<th>상세조회</th>
											<th>삭제</th>
											<th>블랙처리</th>
											<th>정상처리</th>
											<th>회원상태</th>
										</tr>
									</thead>
								<c:forEach var="result" items="${mList}">
									<tbody>
										<tr>
											<td>${result.id}</td>
											<td>${result.name}</td>
											<td>${result.phone}</td>
											<td>${result.email}</td>
											<td><a href="MemberView?id=${result.id}">상세조회</a></td>
											<td><a href="MemberDelete?id=${result.id}">삭제</a></td>
											<td><a href="MemberBlack?id=${result.id}">블랙</a></td>
											<td><a href="UnBlack?id=${result.id}">정상</a></td>
											<td>
											<c:choose>
												<c:when test="${result.state==0}">
												 정상회원
												</c:when>
												<c:when test="${result.state==1}">
												블랙회원
												</c:when>
											</c:choose>
											</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>


			</div>
			<!-- end: .tray-center -->

		</form>
	</section>

	<!-- BEGIN: PAGE SCRIPTS -->

	<!-- jQuery -->
	<script src="vendor/jquery/jquery-1.11.1.min.js"></script>
	<script src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

	<!-- FileUpload JS -->
	<script src="vendor/plugins/fileupload/fileupload.js"></script>
	<script src="vendor/plugins/holder/holder.min.js"></script>

	<!-- Tagmanager JS -->
	<script src="vendor/plugins/tagsinput/tagsinput.min.js"></script>

	<!-- Theme Javascript -->
	<script src="assets/js/utility/utility.js"></script>
	<script src="assets/js/demo/demo.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {

			"use strict";

			// Init Theme Core
			Core.init();

			// Init Demo JS
			Demo.init();

			// select list dropdowns - placeholder like creation
			var selectList = $('.admin-form select');
			selectList.each(function(i, e) {
				$(e).on('change', function() {
					if ($(e).val() == "0")
						$(e).addClass("empty");
					else
						$(e).removeClass("empty")
				});
			});
			selectList.each(function(i, e) {
				$(e).change();
			});

			// Init TagsInput plugin
			$("input#tagsinput").tagsinput({
				tagClass : function(item) {
					return 'label bg-primary light';
				}
			});

		});

	</script>
	<!-- END: PAGE SCRIPTS -->

</body>
</html>