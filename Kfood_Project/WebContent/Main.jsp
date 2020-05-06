<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

<link
	href="https://fonts.googleapis.com/css?family=Gaegu|Jua|Stylish&display=swap"
	rel="stylesheet">



<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">




<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


<script src="https://kit.fontawesome.com/bd39ee1686.js"
	crossorigin="anonymous"></script>
<script>
var id = "${sessionScope.ID}";

function logout() {
	location.href = "Logout";
}
function Modify() {
	location.href = "ModifyView?id=" + id + "";
}
</script>

<style>
html, body {
       position: relative;
       height: 100%;
     }
     body {
       background: #fff;
       font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
       font-size: 14px;
       color:#000;
       margin: 0;
       padding: 0;
     }
     .swiper-container {
       width: 100%;
       height: 700px;
       background: #000;
     }
     .swiper-slide {
       font-size: 18px;
       color:#fff;
       -webkit-box-sizing: border-box;
       box-sizing: border-box;
       padding: 230px 60px;
     }
     .parallax-bg {
       position: absolute;
       left: 0;
       top: 0;
       width: 100%;
       height: 100%;
       -webkit-background-size: cover;
       background-size: cover;
       background-position: center;
     }
     .swiper-slide .title {
       font-size: 41px;
       font-weight: 300;
       padding:0 5px;
     }
     .swiper-slide .subtitle {
       font-size: 21px;
       padding:0 10px;
     }
     .swiper-slide .text {
       font-size: 14px;
       max-width: 400px;
       line-height: 1.3;
     }
	.util{
		cursor:pointer;
	}
</style>
</head>
<body>

<div id="header">
    <div class="logo"><a href="http://127.0.0.1:5500/index.html#"><img src="./img/logo.png"></a></div>

    <div class="bar">
      <label for="toggle" onclick>MENU</label>
      <input type="checkbox" id="toggle"/>
      <div class="menu">
        <a onclick="location.href='ProductListPaging'" style="cursor:pointer" > 상품 게시판 </a>
        <a onclick="location.href='BoardListPaging'" style="cursor:pointer" > 리뷰 게시판 </a>

        <c:if test="${sessionScope.type == 2}">
        <a onclick="location.href='Registration.jsp'" style="cursor:pointer" >상품등록</a>
        <a href="memberList">회원목록</a>
        </c:if>
        <c:if test="${sessionScope.type == 1}">
        <a href="OrdersList">구매요청</a>
        </c:if>
      </div>

      <div class="util">
        <!-- 로그인 홈페이지 이름명 -->


        <!-- 관리자(admin)로 로그인 한 경우 회원 목록을 볼 수 있는 링크 노출 -->
		<c:if test="${sessionScope.id != null}">
			<a onclick="logout()" style="float:right">로그아웃</a>
			<a onclick="Modify()" style="float:right">회원정보수정</a>
	<!-- 	<a onclick="location.href='BoardWrite.jsp'" style="float:right"> 글쓰기</a> 리뷰게시판 안에?  -->
			<a onclick="location.href='MemberView?id=${sessionScope.id}'" style="float:right">마이페이지</a>
		<!--	<button onclick="location.href='CartList.jsp'"> 장바구니 </button> -->
		</c:if>

        <c:if test="${sessionScope.id == null}">
        <a onclick="location.href='Login.jsp'" style="float:right"><i class="fas fa-user-lock" style="font-size: 15px;"></i> &nbsp; 로그인</a>
      	<a onclick="location.href='JoinMember.jsp'" style="float:right" > <i class="fas fa-user-lock" style="font-size: 15px;"></i> &nbsp; 회원가입 </a>
      	</c:if>
      </div>
    </div>

  </div>

  <!-- Swiper -->
  <div class="swiper-container">
    <div class="parallax-bg" style="background-image:url(img/slide/01.jpg)" data-swiper-parallax="0%"></div>
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <div class="title" data-swiper-parallax="-300">한식의 정의</div>
        <div class="subtitle" data-swiper-parallax="-200">한식날</div>
        <div class="text" data-swiper-parallax="-100">
          <p>오는 5일은 설날, 단오, 추석과 함께 우리 민족의 4대 명절의 하나로 봄맞이, 새해 농경준비를 시작했던 '한식'이다.
          한식은 동지로부터 105일째 되는 날로 대개 양력 4월 5일경에 있고, 24절기 상으로는 '청명'이나 그 다음날이 된다.</p>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="parallax-bg" style="background-image:url(img/slide/02.jpg)" data-swiper-parallax="0%"></div>
        <div class="title" data-swiper-parallax="-300" data-swiper-parallax-opacity="0">풍습</div>
        <div class="subtitle" data-swiper-parallax="-200">성묘</div>
        <div class="text" data-swiper-parallax="-100">
          <p>한식날 풍습에는 여러 가지가 있지만 조상들에게 '성묘'를 하는 풍습은 당대로부터 시작되어 우리나라에 전해진 것은 신라 때로 알려져 있다.
          고려시대에는 한식이 대표적 명절의 하나로 중요시되어 관리에게 성묘를 하도록 휴가를 주었을 뿐 아니라 이날만은 어떠한 죄수에게도 형을 집행하지 않도록 금지했다고 한다.</p>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="parallax-bg" style="background-image:url(img/slide/03.jpg)" data-swiper-parallax="0%"></div>
        <div class="title" data-swiper-parallax="-300">음식</div>
        <div class="subtitle" data-swiper-parallax="-200">냉절</div>
        <div class="text" data-swiper-parallax="-100">
          <p>중국에서는 한식을 '냉절'(冷節)이라 하는데 그 유래로 인하여 우리도 이 날은 미리 장만해 놓은 찬 음식을 먹고 불을 쓰지 않았다.
          한식날에는 해수병에 좋다고 하여 진달래꽃을 따다 '진달래 술'을 마련해서 먹었고, 콩볶음을 해서 아이들에게 먹도록 했다.</p>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="parallax-bg" style="background-image:url(img/slide/04.jpg)" data-swiper-parallax="0%"></div>
        <div class="title" data-swiper-parallax="-300">종류</div>
        <div class="subtitle" data-swiper-parallax="-200">주식</div>
        <div class="text" data-swiper-parallax="-100">
          <p>한국인의 일상식은 밥을 주식으로 하고, 여러 가지 반찬을 곁들여 먹는 식사 형태이다.
            주식은 쌀만으로 지은 쌀밥과 조, 보리, 콩, 팥 등의 잡곡을 섞어 지은 잡곡밥을 기본으로 한다.
          부식은 국이나 찌개, 김치와 장류를 기본으로 하고, 육류, 어패류, 채소류, 해조류 등을 이용해서 반찬을 만들었다.</p>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="parallax-bg" style="background-image:url(img/slide/05.jpg)" data-swiper-parallax="0%"></div>
        <div class="title" data-swiper-parallax="-300">영양소</div>
        <div class="subtitle" data-swiper-parallax="-200">탄수화물</div>
        <div class="text" data-swiper-parallax="-100">
          <p>영양적으로 균형 잡힌 식사 구성이다.주식인 곡류에서 생활에 필요한 에너지를 충분히 공급받고,
            채소류, 육류, 생선류 등 다양한 반찬을 부식으로 섭취함으로써 영양의 균형을 이룬다.
            저열량 식사 조리법을 사용한다.한식은 기름을 사용하는 조리법보다는 구이, 찜, 데쳐서
            무치는 등의 습열 조리법이 많아 조리 시 과량의 열량이 첨가되지 않는다.</p>
        </div>
      </div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination swiper-pagination-white"></div>
    <!-- Add Navigation -->
    <div class="swiper-button-prev swiper-button-white"></div>
    <div class="swiper-button-next swiper-button-white"></div>
  </div>

  <div class="sub">
    <div class="news">
      <a href="#">
        <img src="img/07.jpg" />
        <strong>
          한식문화 공모전 행사소식
        </strong>
        </a>
        <p>
          문체부는 “금번 공모전은 한식에 담긴 우리의 문화와 밥상에 묻어있는 가족의 사랑과 그리움 한식이 주었던
            따뜻한 위로를 통해 한식과 관련된 추억을 함께 나누기 위해 마련되었다”고 전했다.
        </p>
    </div>
    <div class="youtube">
      <a href="#">
        <div class="bg">
          <iframe src="https://www.youtube.com/embed/-bRehA_ye4s"
           frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        <strong>
          코아워크 페스티벌 영상
        </strong>
        </a>
        <p>
          “코아워크페스티벌”을 기획하고있는 (주)코아인과 아비뇽 연극제에 참가한
          극단맥이 공동 기획하여, 연극과 공연을 사랑하는 많은 관광객에게 한국의
          공연과 예술을 홍보하였다.
        </p>

    </div>
    <div class="reservation">
      <a onclick="location.href='ProductListPaging'" style="cursor:pointer">
        <img src="img/06.jpg" />
        <strong>
          온라인 주문
        </strong>
       </a>
        <p>
          온라인에서 주문하실 수 있는 메뉴는 한정적입니다. 원하시는 메뉴가 없을시,
          해당 지점으로 직접 전화 주시기 바랍니다.
        </p>

    </div>
  </div>

  <div id="footer">
      <div class="title">
        <h2 class="f1">건강 한식</h2>
        <div class="icon-bar">
          <a href="https://www.facebook.com/" target="_blank" class="facebook"><i class="fab fa-facebook-square"></i></a>
          <a href="https://www.youtube.com/" target="_blank" class="youtube"><i class="fab fa-youtube"></i></a>
          <a href="https://www.instagram.com/?hl=ko" target="_blank" class="instagram"><i class="fab fa-instagram"></i></a>
        </div>
      </div>
      <small id = "si1">이용약관 | 개인정보취급방침 |  이메일무단수집거부 | 사이트맵
          | 상호명 : 건강 한식 | 대표이사 : 김성우</small><br>
      <small id = "si1">사업장 소재지 : 개성직할시 개풍읍 234-45리 | 대표번호 : 010-2805-7322
          | 소비자 상담 번호 : 031-111-1111 | 사업자등록번호 : 513-88-16745
          | 통신판매업신고 : 2012-평양시-00033호 | 개인정보보호책임자 : 류성빈
          | 영업시간 : 12:00 - 02:00</small>
  </div>






<!-- Initialize Swiper -->
<script>
var swiper = new Swiper('.swiper-container', {
     speed: 1500,
     parallax: true,
     loop:true,
     autoplay: {
       delay: 2500,
       disableOnInteraction: false,
     },
     pagination: {
       el: '.swiper-pagination',
       clickable: true,
     },
     navigation: {
       nextEl: '.swiper-button-next',
       prevEl: '.swiper-button-prev',
     },
   });

</script>

</body>
</html>