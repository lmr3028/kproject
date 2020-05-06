<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

<link
	href="https://fonts.googleapis.com/css?family=Gaegu|Jua|Stylish&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


<script src="https://kit.fontawesome.com/bd39ee1686.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>

<script>
	function doAction(value){

		if(value == 0) { //수정

			location.href="ProductModify?product_no=${ProductView.product_no}";

		} else if(value == 1) { // 삭제
			location.href="ProductDelete?product_no=${ProductView.product_no}";
		}

	}

	function logout(){
		location.href="Logout";
	}
</script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/63b21adac5.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id = "header">
	<button onclick = "logout()">로그아웃</button>
	</div>
	<br><br>
	<h1> 상품상세 내역 </h1>

	<br>
	<div id = "position">

		<button id="btn2" onclick="location.href='Main.jsp'"> 메인페이지 </button>
		<button id="btn2" onclick="location.href='Registration.jsp'">상품 등록</button>
		<button id="btn2" onclick="location.href='ProductListPaging'"> 상품 목록 조회 </button>
<!-- <table>
	<tr>
		<td>
			<input type="password" placeholder="비밀번호" name="password">
			<button id="btn2" onclick="location.href ='BoardDelete'">삭제</button>
			<button id="btn2" onclick="location.href = 'BoardModify.jsp'">수정</button>
		</td>
	</tr>
</table> -->
			<c:if test="${sessionScope.id eq 'admin'}">
				<a href="memberList" style="float:right">회원목록 조회</a>
		 		<input type="button" value="수정" onclick='doAction(0)'>
				<input type="button" value="삭제" onclick="doAction(1)">
				</c:if>
	</div>
	<br><br>
	<table>
	<tr>
		<th>글번호</th>
		<td> ${ProductView.product_no} </td>
		<th>상품가격</th>
		<td colspan ="3"> ${ProductView.pprice} </td>
	</tr>
	<tr>
		<td>상품이름</td>
		<td>${ProductView.name}</td>
	</tr>
	<tr>
		<th>상세설명</th>
		<td id = "contents" colspan ="5"> ${ProductView.pex} </td>
	</tr>
	<tr>
		<th>상품사진</th>
		<td colspan ="5"> <img src="ProductUpload/${ProductView.pfile}" width="200" height="200"> </td>
	</tr>
</table>
<button onclick="location.href='CartModify'"> 장바구니 추가 </button>
</body>
</html>