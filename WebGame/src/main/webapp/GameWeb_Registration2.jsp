<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    width: 100%;
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

<body>
<main class="container mt-5">
    <!-- 이미지 유튜브 업로드  enctype="multipart/form-data" -->
    <form name="newgameInfo" method="post" enctype="multipart/form-data" action="./processAddGameInfo.jsp"
        class="needs-validation" novalidate>

       	<div class="row g-5">
            

            <!-- 졸작 소개 텍스트 창 -->
            <div class="col-lg-12">
                <h4 class="mb-3">졸업작품 업로드</h4>
                <div class="row g-3">
                    <div class="col-sm-12">
                        <label class="form-label">팀명</label>
                        <input type="text" class="form-control" name="gameTitle" placeholder="팀명" value="" required>
                    </div>
                    
                    <div class="col-sm-12">
                        <label class="form-label">팀원</label>
                        <input type="text" class="form-control" name="gameTitle" placeholder="팀명" value="" required>
                    </div>                    
                    
                    <div class="col-sm-12">
                        <label  class="form-label">게임 제목</label>
                        <input type="text" class="form-control" name="gameTitle" placeholder="게임 제목" value="" required>
                    </div>
                    <div class="col-12">
                        <label class="form-label">게임 소개</label>
                        <div class="input-group has-validation">
                        <textarea  class="form-control" name="gameTrailer"  placeholder="게임 소개"  value="" required></textarea>
                        </div>
                    </div>
                    <hr class="my-4">
                    <!-- 졸작 소개 텍스트 창 -->
						
                    <!-- 졸작 세부입력 텍스트 창 -->
                    <h4 class="mb-3">상세 설명</h4>
                    <div class="col-12">
                        <label class="form-label">상세 설명</label>
                        <div class="input-group has-validation">
                        <textarea  class="form-control" name="gameDescription"  placeholder="상세 설명"  value="" required></textarea>
                        </div>
                    </div>
                    <hr class="my-4">
                    
                <div class="col-md-5 col-lg-4 order-md-last">

                <h4 class="d-flex justify-content-between  mb-3">
                    <span class="badge bg-secondary rounded-pill  text-center">유튜브 주소 & 스크린샷 업로드</span>
                </h4>
    					<!--  유튜브 업로드 -->
					<div class="input-group pt-2 pb-3">
					    <input type="text" name="gameurl" class="form-control" value="" required placeholder="유튜브 링크">
					</div>
                <!-- 타이틀 이미지 등록 및 미리보기 -->
                <div class="card p-2">
                    <table>
                        <tr>
                            <div class="input-group">
                                <div class="form-control">
                                    <div id="image_container" class="card-img-top"></div>
                                </div>
                            </div>
                        </tr>
                    </table>
                    <div class="input-group pt-2">
                        <input class="form-control" type="file" name="gameTitleImage" value="" required
                             onchange="setThumbnail(event);" >
                    </div>
                </div>
                <!-- 타이틀 이미지 등록 및 미리보기  -->
				<div class="card p-2 col" style="width:100%; height:250px; overflow:auto">
					<table>
					    <tr>
					        <!--  스크린샷 썸네일 -->
					            <div class="input-group">
					                <div class="form-control">
					                    <div id="images_container"></div>
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
            <!-- 이미지 유튜브 업로드 -->
    </form>
    <div class="pb-3">
        <input class="w-20 btn btn-outline-dark " type="submit" value="졸업작품 등록" />
    </div>

    <!-- 졸작 세부입력 텍스트 창 -->
</main>

<script src="./resources/js/form-validation.js"></script>
<script src="./resources/js/thumbnail.js"></script>
</body>

</html>