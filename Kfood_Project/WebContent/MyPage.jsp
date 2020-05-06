<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
  <title>AbsoluteAdmin - A Responsive Bootstrap 3 Admin Dashboard Template</title>
  <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
  <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
  <meta name="author" content="AbsoluteAdmin">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font CSS (Via CDN) -->
  <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

  <!-- Theme CSS -->
  <link rel="stylesheet" type="text/css" href="assets/skin/default_skin/css/theme.css">

  <!-- Admin Forms CSS -->
  <link rel="stylesheet" type="text/css" href="assets/admin-tools/admin-forms/css/admin-forms.css">

  <!-- Favicon -->
  <link rel="shortcut icon" href="assets/img/favicon.ico">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

</head>
<body>

<header id="topbar" class="alt">
        <div class="topbar-left">
          <ol class="breadcrumb">
            <li class="crumb-active">
              <a href="dashboard.html">MyPage</a>
            </li>
            <li class="crumb-icon">
              <a href="Main.jsp">
                <span class="glyphicon glyphicon-home"></span>
                Home
              </a>
            </li>
          </ol>
        </div>
        
      </header>

<div class="page-heading">
            <div class="media clearfix">
              <div class="media-left pr30">
              <table class="table admin-form theme-warning tc-checkbox-1 fs13" id="MemberView">
                
                  
									<thead>
										<tr class="bg-light">
											<th>프로필 사진</th>
										</tr>
									</thead>
									<tbody>
										<tr>
										
											<td><a href="MemberView?id=${result.id}"> </a></td>
										</tr>
									</tbody>
							</table>
           
              </div>                      
              <div class="media-body va-m">
                <h2 class="media-heading">Michael Halls
                  <small> - Profile</small>
                </h2>
                <p class="lead">Lorem ipsum dolor sit amet ctetur adicing elit, sed do eiusmod tempor incididunt</p>
                <div class="media-links">
                  <ul class="list-inline list-unstyled">
                    <li>
                      <a href="#" title="facebook link">
                        <span class="fa fa-facebook-square fs35 text-primary"></span>
                      </a>
                    </li>
                    <li>
                      <a href="#" title="twitter link">
                        <span class="fa fa-twitter-square fs35 text-info"></span>
                      </a>
                    </li>
                    <li>
                      <a href="#" title="google plus link">
                        <span class="fa fa-google-plus-square fs35 text-danger"></span>
                      </a>
                    </li>
                    <li class="hidden">
                      <a href="#" title="behance link">
                        <span class="fa fa-behance-square fs35 text-primary"></span>
                      </a>
                    </li>
                    <li class="hidden">
                      <a href="#" title="pinterest link">
                        <span class="fa fa-pinterest-square fs35 text-danger-light"></span>
                      </a>
                    </li>
                    <li class="hidden">
                      <a href="#" title="linkedin link">
                        <span class="fa fa-linkedin-square fs35 text-info"></span>
                      </a>
                    </li>
                    <li class="hidden">
                      <a href="#" title="github link">
                        <span class="fa fa-github-square fs35 text-dark"></span>
                      </a>
                    </li>
                    <li class="">
                      <a href="#" title="phone link">
                        <span class="fa fa-phone-square fs35 text-system"></span>
                      </a>
                    </li>
                    <li>
                      <a href="#" title="email link">
                        <span class="fa fa-envelope-square fs35 text-muted"></span>
                      </a>
                    </li>
                    <li class="hidden">
                      <a href="#" title="external link">
                        <span class="fa fa-external-link-square fs35 text-muted"></span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
        </div>
 <script src="vendor/jquery/jquery-1.11.1.min.js"></script>
  <script src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

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


  });
  </script>
</body>
</html>