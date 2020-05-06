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
		<form action="BoardListPaging" method="post">
			<!-- begin: .tray-center -->
			<div class="tray tray-center" style="height: 1044px;">

				<div class="panel mb25 mt5">
					<div class="panel-heading">
						<div class="col-md-10">
							<a onclick="location.href='ProductListPaging'"
								style="cursor: pointer"><h3>리뷰 게시판</h3></a>
						</div>


					</div>
					<div class="panel-menu p12 admin-form theme-primary">
						<div class="row">
							<div class="col-md-2">
								<div>
									<button type="button" onclick="location.href='Main.jsp'"
										class="btn active btn-default btn-block">메인페이지</button>
								</div>
							</div>

							<div class="col-md-2">
								<div>
									<button type="button"
										onclick="location.href='CartList?id=${sessionScope.id}'"
										class="btn active btn-default btn-block">내 장바구니</button>
								</div>
							</div>
							<div class="col-md-2">
								<div>
									<button type="button"
										onclick="location.href='BoardListPaging?searchType=hits'"
										class="btn active btn-default btn-block">조회수</button>
								</div>
							</div>
							<c:if test="${sessionScope.id eq 'admin'}">
								<div class="col-md-2">
									<div>
										<button type="button"
											onclick="location.href='Registration.jsp'"
											class="btn active btn-default btn-block">상품 등록</button>
									</div>
								</div>
							</c:if>
							<c:if test="${sessionScope.id != null}">
								<div class="col-md-2">
									<button type="button" onclick="logout()"
										class="btn active btn-default btn-block">로그아웃</button>
								</div>
							</c:if>
						</div>
					</div>
					<div class="panel-menu p12 admin-form theme-primary">
						<div class="row">
							<div class="col-md-5">
								<label class="field select"> <select
									id="filter-category" name="searchType" class=""
									onfocus="inInput(this)" onblur="outInput(this)">
										<option value="name">이름</option>
								</select> <i class="arrow"></i>
								</label>
							</div>
							<div class="col-md-5">
								<label class="field select"> <input type="text"
									name="searchValue" id="name2"
									class="text-center event-name gui-input br-light"
									placeholder="">

								</label>
							</div>
							<div class="col-md-2">
								<div>
									<button type="submit" class="btn active btn-info btn-block">검색</button>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-body pn">
						<div class="table-responsive">
							<table class="table admin-form theme-warning tc-checkbox-1 fs13">
								<thead>
									<tr class="bg-light">
										<th>글 번호</th>
										<th>상품 명</th>
										<th>제목</th>
										<th>아이디</th>
										<th>작성일자</th>
										<c:if test="${sessionScope.id != null}">
										<th>삭제</th>
										</c:if>
										<th>상품 사진</th>
										<th>조회수</th>
									</tr>
								</thead>
								<c:forEach var="result" items="${boardList}">
								<tbody>
										<tr>
											<td>${result.boardno}</td>
											<td>${result.name}</td>
											<td><a href="BoardView?boardno=${result.boardno}">${result.title}</a></td>
											<td>${result.id}</td>
											<td>${result.bdate}</td>
											<td><div class="btn-group text-right">
														<button type="button"
															class="btn btn-danger br2 btn-xs fs12"
															onClick="location.href='BoardDelete?boardno=${result.boardno}'">
															삭제</button>
													</div></td>
											<td class="w100"><img
												class="img-responsive mw40 ib mr10"
												src="ProductUpload/${result.pfile}"></td>
											<td>${result.hits}</td>
										</tr>
								</tbody>
							</c:forEach>
							</table>
							<!-- 페이징 처리 -->
							<!-- 현재 페이지 값보다 1보다 작거나  같으면 텍스트만 주고 1보다 큰 값이면 링크값을 줌 -->
							<div class="row">
								<div class="col-md-6 col-centered">
									<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
									<!-- 이전으로 -->
									<c:if test="${paging.page>1}">
										<a href="ProductListPaging?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>

									<!-- if, else if -->
									<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
										var="i" step="1">
										<c:choose>
											<c:when test="${i eq paging.page}">
												<!-- 페이지 값 텍스트로 주고 나머지값은 링크로 -->
			${i}
			</c:when>
											<c:otherwise>
												<a href="ProductListPaging?page=${i}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- 다음 버튼을 링크로 줄지 말지 -->
									<c:if test="${paging.page>=paging.maxPage}">
		[다음]
	</c:if>

									<c:if test="${paging.page<paging.maxPage}">
										<a href="ProductListPaging?page=${paging.page+1}">[다음]</a>
									</c:if>
								</div>
							</div>
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

			init();

		});
	</script>
	<!-- END: PAGE SCRIPTS -->

</body>
</html>