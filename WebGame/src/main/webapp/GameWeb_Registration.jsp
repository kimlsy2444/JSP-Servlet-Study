<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>졸업작품 업로드</title>
<style>
body {
	background: #eaeaea;
}

.card img {
	width: 100%;
	height: 280px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}


@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<link href="./resources/css/form-validation.css" rel="stylesheet">
</head>

<body>
	<main class="container mt-5">
		<!-- 이미지 유튜브 업로드  enctype="multipart/form-data" -->
		<form name="newgameInfo" method="post" enctype="multipart/form-data"
			action="./processAddGameInfo.jsp" class="needs-validation" novalidate>

			<!-- 졸작 소개 텍스트 창 -->
			<h4>
				<span class="badge bg-secondary rounded-pill  text-center">졸업작품
					업로드</span>
			</h4>

			<div class="col-sm-12">
				<label class="form-label"></label> <input type="text"
					class="form-control" name="gameTeamname" placeholder="팀명" value="" required>
			</div>

			<div class="col-sm-12">
				<label class="form-label"></label>
				<div  class ="row row-cols-6" id = "box"> 
					<div class ="col">
						<input type="button" class ="btn btn-outline-dark" value="팀원 추가" onclick="add_textbox()">
			           <!-- <input type="button" class ="btn btn-outline-dark" value="입력 결과 출력" onclick="input_result(this.form)"> -->
					</div>
					
		         </div>
			 </div> 

			<div class="col-sm-12">
				<label class="form-label"></label> <input type="text"
					class="form-control" name="gameTitle" placeholder="게임 제목" value=""
					required>
			</div>
			<div class="col-12">
				<label class="form-label"></label>
				<div class="input-group has-validation">
					<textarea class="form-control" name="gameTrailer"
						placeholder="게임 소개" value="" required></textarea>
				</div>
			</div>
			<hr class="my-4">
			<!-- 졸작 소개 텍스트 창 -->

			<!-- 졸작 세부입력 텍스트 창 -->
			<h4>
				<span class="badge bg-secondary rounded-pill  text-center">상세 설명</span>
			</h4>
			<div class="col-12">
				<label class="form-label"></label>
				<div class="input-group has-validation">
					<textarea class="form-control" name="gameDescription"
						placeholder="상세 설명" value="" required></textarea>
				</div>
			</div>
			<hr class="my-4">


			<!-- 이미지 유튜브 업로드 -->
			<!--  유튜브 업로드 -->
			<h4 class="d-flex justify-content-between ">
				<span class="badge bg-secondary rounded-pill  text-center">게임
					소개 영상 업로드</span>
			</h4>
			<div class="input-group pt-2 pb-3">
				<input type="text" name="gameurl" class="form-control " value=""
					required placeholder="게임 소개 영상">
			</div>
			<!--  유튜브 업로드 -->
			<div class="row row-cols-2 ">
				 <!-- 타이틀 이미지 등록 및 미리보기 -->
			      <div class="col">
   			      <h4 class="d-flex justify-content-between ">
			          <span class="badge bg-secondary rounded-pill  text-center">타이틀 이미지</span>
			      </h4>
			          <div class="card p-2" style="width:100%; height:330px;">
			              <table>
			                  <tr>
			                      <div class="input-group">
			                          <div class="form-control">
			                              <div id="image_container" class="card-img-top"></div>
			                          </div>
			                      </div>
			                  </tr>
			              </table>
			
			          </div>
			          <div class="input-group pt-2">
			              <input class="form-control" type="file" name="gameTitleImage" value="" required
			                     onchange="setThumbnail(event);">
			          </div>
			      </div>
			      <!-- 타이틀 이미지 등록 및 미리보기 -->
			
			      <!-- 썸네일 이미지 등록 및 미리보기 -->
			      <div class="col">
   			      <h4 class="d-flex justify-content-between ">
			          <span class="badge bg-secondary rounded-pill  text-center">인게임 이미지</span>
			      </h4>			      
			          <div class="card p-2" style="width:100%; height:330px;">
			              <table>
			                  <tr>
			                      <div class="input-group">
			                          <div class="form-control">
			                              <div id="images_container" style="overflow-y:auto; white-space:nowrap;">
			                              </div>
			                          </div>
			                      </div>
			                  </tr>
			              </table>
			
			          </div>
			          <div class="input-group pt-2">
			              <input class="form-control" type="file" name="gameImage" value="" required multiple
			                  onchange="setDetailImage(event);">
			          </div>
			      </div>
			      <!-- 썸네일 이미지 등록 및 미리보기 -->

			</div>
			<div class="pt-3 pb-3">
				<input class="w-20 btn btn-outline-dark " type="submit" onclick="input_result(this.form)"
					value="작품 등록" /> <a href="GameWeb_Main.jsp"
					class="w-20 btn btn-outline-danger ">작품 취소</a>
			</div>
		</form>
	</main>
	<script src="./resources/js/addinputbox.js"></script>
	<script src="./resources/js/form-validation.js"></script>
	<script src="./resources/js/thumbnail.js"></script>
</body>

</html>