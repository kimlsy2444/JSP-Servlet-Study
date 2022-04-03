<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <title>졸업작품 업로드</title>
  <style>
    body {
      background: #eaeaea;
    }
    .card img {
      width:100%;
      height: 150px;
	}
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>


  <link href="./resources/css/form-validation.css" rel="stylesheet">
</head>

<body >


  <main class="container mt-5">
   <!-- 이미지 유튜브 업로드 -->
    <form class="needs-validation" novalidate>
    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between  mb-3">
          <span class="badge bg-secondary rounded-pill  text-center">유튜브 주소 & 스크린샷 업로드</span>
        </h4>

        <form>
        </form>
        
        <form class="card p-2">
          <table>
            <tr>
            <div class="input-group">
              <div class="form-control">
              
              <div id="image_container"  class="card-img-top"></div>
              </div>
            </div>
            </tr>
          </table>
      <!-- 타이틀 이미지 썸네일 -->
          <div class="input-group pt-2">
            <input class="form-control" type="file"  value="" required   onchange="setThumbnail(event);" >
            
          </div>
        </form>
        <form class="card p-2">
          <div style="width:100%; height:250px; overflow:auto">
          <table>
            <tr>
              <!-- 스크린샷 썸네일 -->
            <div class="input-group">
              <div class="form-control">
                <div id="images_container"></div>
              </div>
            </div>
            </tr>
          </table>
          </div>
          <div class="input-group pt-2">
          <input class="form-control" type="file"  value="" required  multiple onchange="setDetailImage(event);" >
          </div>
        </form>
        <div class="input-group pt-2 pb-3">
          <input type="text" class="form-control" value="" required  placeholder="유튜브 링크" >
        </div>
        </div>
    <!-- 이미지 유튜브 업로드 -->
    
    <!-- 졸작 소개 텍스트 창 -->
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">졸업작품 업로드</h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">

           <div class="col-sm-12">
              <label for="firstName" class="form-label">게임 제목</label>
			  <input type="text" id ="gameInfoTitle" name = "gameInfoTitle" class ="form-control" placeholder="게임 제목" required>
               <div class="invalid-feedback">
                게임 제목 미입력
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">간단한 소개</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name = "gameInfoTitle" placeholder="짧은 소개" value="" required>
                <div class="invalid-feedback">
                  게임 소개 미입력
                </div>
              </div>
            </div>
            <hr class="my-4">
    <!-- 졸작 소개 텍스트 창 -->

    <!-- 졸작 세부입력 텍스트 창 -->
            <h4 class="mb-3">게임 설명 & 플레이 방법</h4>
            <div class="form-floating">
              <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
              <label for="floatingTextarea">Comments</label>
            </div>

            <hr class="my-4">

        </form>
        <div class="pb-3">
          <button class="w-20 btn btn-outline-dark ">졸업작품 등록</button>
        </div>
      </div>
    </div>
    <!-- 졸작 세부입력 텍스트 창 -->
  </main>

  </div>

  <!-- 푸터 학교 정보 -->
  <footer class="p-4 p-md-5" style="background:#303033">
    <div class="container">
      <small style="display: block; text-align: right; color:white" ;>과사무실 : 아산캠퍼스 제1공학관 504-1호</small>
      <small style="display: block; text-align: right; color:white">전화: 041-540-5696</small>
    </div>
  </footer>


  <script src="./resources/js/form-validation.js"></script>
   <script src="./resources/js/thumbnail.js"></script>
</body>

</html>