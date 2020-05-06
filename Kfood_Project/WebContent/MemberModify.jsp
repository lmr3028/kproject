<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Font CSS (Via CDN) -->
  <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

  <!-- Theme CSS -->
  <link rel="stylesheet" type="text/css" href="assets/skin/default_skin/css/theme.css">

  <!-- Admin Forms CSS -->
  <link rel="stylesheet" type="text/css" href="assets/admin-tools/admin-forms/css/admin-forms.css">

  <!-- Favicon -->
  <link rel="shortcut icon" href="assets/img/favicon.ico">

<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode (
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
//	function idCheck() {

	//	var exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,10}$/;
	//	var id = document.getElementById("idForm");
	//	var alo = document.getElementById("alo");
	//	if (id.value.match(exp)) {
	//		alo.style.color = "blue";
	//		alo.innerHTML = "<h2> 적합한 아이디입니다.</h2> ";

	//		return true;
	//	} else {
	//		alo.style.color = "red";
	//		alo.innerHTML = "<h2> 적합하지 않은 아이디입니다.</h2> ";

	//		return false;
	//	}
//	}

//	function checkReset() {
//		document.getElementById("alo").innerHTML = "";
//	}

	function pwdCheck() {
		var exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		var pwd = document.getElementById("pwd");
		var pck = document.getElementById("pck");

		if (pwd.value.match(exp)) {
			pck.style.color = "blue";
			pck.innerHTML = "<h2> 적합한 비밀번호입니다.</h2> ";

			return true;
		} else {
			pck.style.color = "red";
			pck.innerHTML = "<h2> 적합하지 않은 비밀번호입니다.</h2> ";

			return false;
		}
	}
	// 입력창 벗어나면 없어지게끔
	function checkReset2() {
		document.getElementById("pck").innerHTML = "";
	}

	function pwdConfirm2() {
		var pwd = document.getElementById("pwd").value;
		var pwdConfirm = document.getElementById("pwdConfirm").value;
		var confirmMsg = document.getElementById("confirmMsg");
		if (pwd == pwdConfirm) {
			confirmMsg.style.color = "green";
			confirmMsg.innerHTML = "<h2>비밀번호 일치!!</h2>";

			return true;
		} else {
			confirmMsg.style.color = "red";
			confirmMsg.innerHTML = "<h2>비밀번호 불일치!!</h2>";

			return false;
		}
	}
	function checkReset3() {
		document.getElementById("confirmMsg").innerHTML = "";
	}

	function email_change() {
		if (document.join.email.options[document.join.email.selectedIndex].value == '0') {
			document.join.email2.disabled = true;
			document.join.email2.value = "";
		}
		if (document.join.email.options[document.join.email.selectedIndex].value == '9') {
			document.join.email2.disabled = false;
			document.join.email2.value = "";
			document.join.email2.focus();
		} else {
			document.join.email2.disabled = true;
			document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
		}
	}

	function phoneCheck() {
		var exp = /^\d{3}-\d{4}-\d{4}$/;
		var phone = document.getElementById("phone");
		var phoneCheck = document.getElementById("phoneCheck");

		if (phone.value.match(exp)) {
			phoneCheck.style.color = "blue";
			phoneCheck.innerHTML = "<h2> 적합한 번호입니다.</h2> ";
		} else {
			phoneCheck.style.color = "red";
			phoneCheck.innerHTML = "<h2> 적합하지 않은 번호입니다.</h2> ";
		}
	}

	function checkReset4() {
		document.getElementById("phoneCheck").innerHTML = "";
	}

	function onSubmit() {

	//	if(!ok()){
	//		return false;
	//	};

	//	console.log("submit1")

//		if (!idCheck()) {
//			console.log("submit")
//			alert("ID를 확인해주세요.");
//			document.getElementById("idForm").value = "";
//			document.getElementById("idForm").focus();
//			return false;
//		}

		if (!pwdCheck()) {
			alert("비밀번호를 확인해주세요.");
			document.getElementById("pwd").value = "";
			document.getElementById("pwd").focus();
			return false;
		}

		if (!pwdConfirm2()) {
			alert("비밀번호 재확인이 틀립니다.");
			document.getElementById("pwdConfirm").value = "";
			document.getElementById("pwdConfirm").focus();
			return false;
		}

		signForm.submit();
	}


</script>
</head>
<body>


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

        <div class="admin-form theme-info mw700" style="margin-top: 3%;" id="login1">

          <div class="row mb15 table-layout">

            <div class="col-xs-6 va-m pln">
              <a href="Main.jsp" title="Return to Dashboard">
           <!--     <img src="assets/img/logos/logo_white.png" title="AdminDesigns Logo" class="img-responsive w250">   -->
              </a>
            </div>

          </div>

          <div class="panel panel-info mt10 br-n">

            <div class="panel-heading heading-border bg-white">
              <span class="panel-title hidden">
                <i class="fa fa-sign-in"></i>Register</span>
              <div class="section row mn">
                <div class="col-sm-4">
                  <a href="https://www.facebook.com/" target="_blank" class="button btn-social facebook span-left mr5 btn-block">
                    <span>
                      <i class="fa fa-facebook"></i>
                    </span>Facebook</a>
                </div>
                <div class="col-sm-4">
                  <a href="https://twitter.com/" target="_blank" class="button btn-social twitter span-left mr5 btn-block">
                    <span>
                      <i class="fa fa-twitter"></i>
                    </span>Twitter</a>
                </div>
                <div class="col-sm-4">
                  <a href="https://www.google.co.kr/" target="_blank" class="button btn-social googleplus span-left btn-block">
                    <span>
                      <i class="fa fa-google-plus"></i>
                    </span>Google+</a>
                </div>
              </div>
            </div>

            <form method="post" action="MemberModify" id="account2" name="signForm" enctype="multipart/form-data">
              <div class="panel-body p25 bg-light">
                <div class="section-divider mt10 mb40">
                  <span>계정 정보</span>
                </div>
                <!-- .section-divider -->

                <div class="section row">
                  <div class="col-md-6">
                    <label for="firstname" class="field prepend-icon">
						<input type="text" name="id" id="lastname" class="gui-input" value ="${sessionScope.id}" readonly>
						<input type="hidden" name="id" value="${View.id}">
						<span id="alo"></span>
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-user"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->

                  <div class="col-md-6">
                    <label for="lastname" class="field prepend-icon">
                      <input type="text" name="name" id="lastname" class="gui-input" placeholder="이름" value="${View.name}" readonly>
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-user"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->
                </div>
                <div class="section">
                    <label for="lastname" class="field prepend-icon">
                      <input type="password" name="pw" id="pwd" class="gui-input" placeholder="비밀번호" onkeyup="pwdCheck()"
                      	onblur="checkReset2()" value="${View.pw}">
                      	<span id="pck"></span>
                      <label for="confirmPassword" class="field-icon">
                      	<i class="fa fa-lock"></i>
                     </label>
                    </label>
                  </div>

                 <div class="section">
                  <label for="lastname" class="field prepend-icon">
                      <input type="password" id="pwdConfirm" class="gui-input" placeholder="비밀번호 확인" onkeyup="pwdConfirm2()"
                      onblur="checkReset3()">
                      	<span id="confirmMsg"></span>
                      <label for="confirmPassword" class="field-icon">
                      	<i class="fa fa-lock"></i>
                     </label>
                    </label>
                </div>
                <!-- end .section row section -->

                <div class="section">
                  <div class="smart-widget sm-right smr-120">
                    <label for="username" class="field prepend-icon">
                      <input type="text" name="postcode" id="sample4_postcode" class="gui-input" placeholder="우편번호" value="${View.postcode}">
                      <label for="username" class="field-icon">
                        <i class="fa fa-home"></i>
                      </label>
                    </label>
                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="button">
                  </div>
                  <!-- end .smart-widget section -->
                </div>

                <div class="section row">
                  <div class="col-md-6">
                    <label for="firstname" class="field prepend-icon">
                      <input type="text" name="roadAddress" id="sample4_roadAddress" class="gui-input" placeholder="도로명 주소" value="${View.roadAddress}">
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-home"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->

                  <div class="col-md-6">
                    <label for="lastname" class="field prepend-icon">
                      <input type="text" name="jibunAddress" id="sample4_jibunAddress" class="gui-input" placeholder="지번 주소" value="${View.jibunAddress}">
                       <span id="guide" style="color: #999; display: none"></span>
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-home"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->
                </div>

				<div class="section row">
                  <div class="col-md-6">
                    <label for="firstname" class="field prepend-icon">
                      <input type="text" name="detailAddress" id="sample4_detailAddress" class="gui-input" placeholder="상세 주소" value="${View.detailAddress}">
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-home"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->

                  <div class="col-md-6">
                    <label for="lastname" class="field prepend-icon">
                      <input type="text" name="extraAddress" id="sample4_extraAddress" class="gui-input" placeholder="참고항목" value="${View.extraAddress}">
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-home"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->
                </div>

				<div class="section">
                  <label for="password" class="field prepend-icon">
                    <input type="text" name="phone" class="gui-input" placeholder="휴대폰 번호" value="${View.phone}">
                    <label for="password" class="field-icon">
                      <i class="fa fa-unlock-alt"></i>
                    </label>
                  </label>
                </div>
                <!-- end section -->

                <div class="section">
                  <label for="email" class="field prepend-icon">
                    <input type="email" name="email" id="email" class="gui-input" placeholder="이메일" value="${View.email}">
                    <label for="email" class="field-icon">
                      <i class="fa fa-envelope"></i>
                    </label>
                  </label>
                </div>

				<input type="file" name="profile" class="gui-input" value="${View.profile}">


			<!-- button 하나만 있으면 자동 submit이라 type을 버튼으로 지정해줘야 함 -->
                <button type="button" onclick="onSubmit()" class="button btn-primary pull-right">정보수정</button>
                
              </div>
              <!-- end .form-footer section -->
            </form>
          </div>
        </div>

      </section>
      <!-- End: Content -->

    </section>
    <!-- End: Content-Wrapper -->
</div>

	<br>
	<br>
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
  <script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
      Loc: {
        x: window.innerWidth / 2.1,
        y: window.innerHeight / 4.2
      },
    });
  });
  </script>

  <!-- END: PAGE SCRIPTS -->
</body>
</html>