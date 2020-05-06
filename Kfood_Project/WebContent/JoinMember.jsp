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
	function idCheck() {

		var exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,10}$/;
		var id = document.getElementById("idForm");
		var alo = document.getElementById("alo");
		if (id.value.match(exp)) {
			alo.style.color = "blue";
			alo.innerHTML = "<h2> 적합한 아이디입니다.</h2> ";

			return true;
		} else {
			alo.style.color = "red";
			alo.innerHTML = "<h2> 적합하지 않은 아이디입니다.</h2> ";

			return false;
		}
	}

	function checkReset() {
		document.getElementById("alo").innerHTML = "";
	}

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

		if(!ok()){
			return false;
		};

		console.log("submit1")

		if (!idCheck()) {
			console.log("submit")
			alert("ID를 확인해주세요.");
			document.getElementById("idForm").value = "";
			document.getElementById("idForm").focus();
			return false;
		}

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

	function ok() {

		var radios = document.querySelectorAll('input[name="agree1"]:checked');
		var value = radios.length>0? radios[0].value: null;

		if(value == null || value == "no"){
			alert("개인정보 수집 동의하셔야 됩니다");
			return false;
		}
		return true;
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

            <div class="col-xs-6 text-right va-b pr5">
              <div class="login-links">
                <a href="Login.jsp" class="" title="Sign In">로그인</a>
                <span class="text-white"> | </span>
                <a href="JoinMember.jsp" class="active" title="Register">회원가입</a>
              </div>

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

            <form method="post" action="memberServer" id="account2" name="signForm" enctype="multipart/form-data">
              <div class="panel-body p25 bg-light">
                <div class="section-divider mt10 mb40">
                  <span>계정 입력 정보</span>
                </div>
                <!-- .section-divider -->

                <div class="section row">
                  <div class="col-md-6">
                    <label for="firstname" class="field prepend-icon">
                      <input type="text" name="id" id="idForm" class="gui-input" placeholder="아이디" onkeyup="idCheck()"
						onblur="checkReset()">
						<span id="alo"></span>
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-user"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->

                  <div class="col-md-6">
                    <label for="lastname" class="field prepend-icon">
                      <input type="text" name="name" id="lastname" class="gui-input" placeholder="이름">
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
                      	onblur="checkReset2()">
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
                      <input type="text" name="postcode" id="sample4_postcode" class="gui-input" placeholder="우편번호">
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
                      <input type="text" name="roadAddress" id="sample4_roadAddress" class="gui-input" placeholder="도로명 주소">
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-home"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->

                  <div class="col-md-6">
                    <label for="lastname" class="field prepend-icon">
                      <input type="text" name="jibunAddress" id="sample4_jibunAddress" class="gui-input" placeholder="지번 주소">
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
                      <input type="text" name="detailAddress" id="sample4_detailAddress" class="gui-input" placeholder="상세 주소">
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-home"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->

                  <div class="col-md-6">
                    <label for="lastname" class="field prepend-icon">
                      <input type="text" name="extraAddress" id="sample4_extraAddress" class="gui-input" placeholder="참고항목">
                      <label for="firstname" class="field-icon">
                        <i class="fa fa-home"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->
                </div>

				<div class="section">
                  <label for="password" class="field prepend-icon">
                    <input type="text" name="phone" class="gui-input" placeholder="휴대폰 번호">
                    <label for="password" class="field-icon">
                      <i class="fa fa-unlock-alt"></i>
                    </label>
                  </label>
                </div>
                <!-- end section -->

                <div class="section">
                  <label for="email" class="field prepend-icon">
                    <input type="email" name="email" id="email" class="gui-input" placeholder="이메일">
                    <label for="email" class="field-icon">
                      <i class="fa fa-envelope"></i>
                    </label>
                  </label>
                </div>
                <!-- end section -->
				<label><input type="radio" name="gender" value="남자"> 남자</label>
				<label><input type="radio" name="gender" value="여자"> 여자</label> <br> <br>
                <!-- end section -->

				<input type="file" name="profile" class="gui-input">


                <div class="section-divider mv40">
                  <span>약관 검토</span>
                </div>
                <!-- .section-divider -->

              </div>
              <!-- end .form-body section -->
              <div class="panel-footer clearfix">
              <br><br><br>
<textarea readonly="readonly" name=content1 rows=7 cols=93>
       제 1 장 총 칙



제 1 조 (목적)
이 약관은 {COMPANY_NAME}(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.



제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.



제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.



제 2 장 서비스 이용계약



제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.



제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.



제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우



제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.



제 3 장 계약 당사자의 의무



제 8 조 (사이트의 의무)
① 사이트는 회원에게 각 호의 서비스를 제공합니다.
가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
나. 추가 도메인 등록시 개인정보 자동 입력
다. 도메인 등록, 관리를 위한 각종 부가서비스
② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.



제 9 조 (회원의 의무)
① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단되는 행위
바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.



제 4 장 서비스 제공 및 이용



제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.



제 11 조 (서비스 제한 및 정지)
① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.



제5장 계약사항의 변경, 해지



제 12 조 (정보의 변경)
회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.



제 13 조 (계약사항의 해지)
회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
② 정보통신윤리위원회가 이용해지를 요구한 경우
③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.



제6장 손해배상



제 14 조 (면책조항)
① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.



제 15 조 (관할법원)



서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.
       </textarea>
				<label class="option block mt15">
                    <input type="radio" name="agree1" value="yes">
                    <span class="checkbox"></span>이용 약관에
                    <a href="#" class="theme-link"> 동의합니다. </a>
                  </label>
                  <label class="option block mt15">
                    <input type="radio" name="agree1" value="no">
                    <span class="checkbox"></span>이용 약관에
                    <a href="#" class="theme-link"> 동의하지 않습니다. </a>
                  </label>
	<!-- 		<input type=radio name=agree1 value="yes">동의
			<input type=radio name=agree1 value="no">동의안함 -->

			<!-- button 하나만 있으면 자동 submit이라 type을 버튼으로 지정해줘야 함 -->
                <button type="button" onclick="onSubmit()" class="button btn-primary pull-right">회원가입</button>
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