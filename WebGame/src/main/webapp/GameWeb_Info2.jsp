<%@page import="dbconn.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="dao.GameInfoRepository"%>
<%@page import="dto.GameInfo"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<!doctype html>
<% request.setCharacterEncoding("UTF-8"); %>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>졸업작품 정보</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link href="./resources/css/List.css?ver=1" rel="stylesheet" />
  <link href="css/slider.css" rel="stylesheet" />
</head>
<style type="text/css">

</style>
<body>
 <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="GameWeb_Main.jsp"><img src="./resources/assets/img/hoseoGame.png"
                    alt="..." /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars ms-1"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link" href="#">Senior Project</a></li>
                    <li class="nav-item"><a class="nav-link" href="#Code_in.jsp">Upload</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navigation-->
<!-- Product section-->
<br><br>
<section class="pb-6">
  <div class="container px-4 px-lg-5 my-5">
    <div class="row gx-4 gx-lg-5 align-items-center">
      <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0"
          src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
      <div class="col-md-6">
        <h1 class="display-5 fw-bolder">게임 제목</h1>
        <div class="fs-5 mb-5">
          <span>팀이름</span><br/>
          <span>이준성</span> <span>이준성</span> <span>이준성</span> <span>이준성</span> <span>이준성</span> <span>이준성</span>
        </div>
        <p class="lead">생전에 야스오의 이부형제였던 요네는 마을 검술 학교에서 촉망받는 학생이었다. 
          그러나 형제의 손에 죽음을 맞이한 후 영혼 세계의 악령에 쫓기자 악령의 검으로 악령을 죽일 수밖에 없었다.
          악령의 가면을 써야 하는 저주를 받게 된 요네는 자신이 어떤 존재가 되었는지 알아내기 위해 쉬지 않고 
          그 악령과 같은 존재들을 뒤쫓는다.</p>
        <div class="d-flex">

        </div>
      </div>
    </div>
  </div>
</section>
<!-- Related items section-->

<!-- 게임 스크린샷 -->


<section class="py-5 bg-light">
  <div class="container px-5 px-lg-5 mt-5">
    <h2 class="fw-bolder mb-4">스크린샷</h2>

    <!-- Swiper -->
    <div id="body_slider" style="--swiper-navigation-color: #000; --swiper-pagination-color: #000"
      class="swiper mySwiper2 pb-4 ">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-1.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-2.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-3.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-4.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-5.jpg" />
        </div>
      </div>
      <div class="swiper-button-next" onselectstart="return false"></div>
      <div class="swiper-button-prev" onselectstart="return false"></div>
    </div>
    <div thumbsSlider="" class="swiper mySwiper" id="over_slider">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-1.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-2.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-3.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-4.jpg" />
        </div>
        <div class="swiper-slide">
          <img src="https://swiperjs.com/demos/images/nature-5.jpg" />
        </div>

      </div>
    </div>
  </div>
</section>
<!-- 게임 스크린샷 -->
<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


<!-- Initialize Swiper -->
<script>
  var swiper = new Swiper(".mySwiper", {
    loop: true,
    spaceBetween: 10,
    slidesPerView: 4,
    freeMode: true,
    watchSlidesProgress: true,
  });
  var swiper2 = new Swiper(".mySwiper2", {
    loop: true,
    spaceBetween: 10,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    thumbs: {
      swiper: swiper,
    },
  });
</script>


<!-- Footer-->
<footer class="footer py-4">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2022</div>
      <div class="col-lg-4 my-3 my-lg-0">
        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <div class="col-lg-4 text-lg-end">
        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
      </div>
    </div>
  </div>
</footer>

<footer class="p-4 p-md-5" style="background:#303033">
  <div class="container">
    <small style="display: block; text-align: right; color:white">과사무실 : 아산캠퍼스 제1공학관 504-1호</small>
    <small style="display: block; text-align: right; color:white">전화: 041-540-5696</small>
  </div>
</footer>
<!-- Footer-->



    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/nav.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>		



</body>
<script src="./resources/js/form-validation.js"></script>

</html>
