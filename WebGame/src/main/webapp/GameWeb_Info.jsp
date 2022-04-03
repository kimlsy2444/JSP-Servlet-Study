<%@page import="dao.GameInfoRepository"%>
<%@page import="dto.GameInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<% request.setCharacterEncoding("UTF-8"); %>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>게임소프트웨어 졸업작품</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="./resources/css/infobody.css" />

  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>

<body>
  <!-- 게임포스터 -->
  <main class="container">
  	<%
		//넘어온 게임정보 아이디값을 얻어낸다. (타이틀 제목따라서 보여주는 화면단의 정보를 바꿔줌)
		String id = request.getParameter("id");
		GameInfoRepository dao = GameInfoRepository.getInstance();
	
		//넘어온 게임 정보값을 이용해서 실제 해당하는 GameInfo객체를 얻고 있다.
		GameInfo gameInfo = dao.getGameInfoById(id);		
	%>
   <!-- 게임포스터 -->
    <div class ="text-center">
      <figure class=" p-4 p-md-5 mb-4">
      <img class="figure-img img-fluid rounded " 
		   src="${pageContext.request.contextPath}/resources/images/<%= gameInfo.getGameTitleImage()%>">
      </figure>
    </div>
    <!-- 게임포스터 -->


    <div class="aside">
      <div class="row g-5">

        <div class="col-md-7">
            <h2 class=" text-center">
              <p class="fs-3"><b><%=gameInfo.getGameTitle() %></b></p>
            </h2>
            <p class="fs-5 m-5"><b><%=gameInfo.getGameDescription() %></b>
            </p>
    
        </div>
        <div class="col-md-4">
			<p class="fs-3  text-center"><b>게임 스크린샷</b></p>
          		<div class = "col-md-4">
		            <table class="table table-bordered text-center">
		              <tr class="row">
		              
		                <td>
		                  <div class=" mb-3 rounded text-center ratio " style="width:350px; height:195px;">
		                    <iframe class="img-thumbnail " src=<%=gameInfo.getGameurl() %>>
		                    </iframe>
		                  </div>
		                </td>
		                
			            <td>
			              <div class=" mb-3 rounded text-center " style="width:350px; height:195px;">
			                <img class=" img-thumbnail" style="width:100%; height:100%" src="${pageContext.request.contextPath}/resources/images/<%= gameInfo.getGameImage()%>">
			              </div>
			            </td>
			          </tr>
		      		</table>
   				</div>
    	</div>
    </main>
    <!-- 게임 스크린샷 -->


  <!-- footer 학교 정보 -->
  <footer class="p-4 p-md-5" style="background:#303033">
    <div class="container">
      <small style="display: block; text-align: right; color:white" ;>과사무실 : 아산캠퍼스 제1공학관 504-1호</small>
      <small style="display: block; text-align: right; color:white">전화: 041-540-5696</small>
    </div>
  </footer>
  <!-- footer 학교 정보 -->

</body>
</html>