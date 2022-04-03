<%@page import="dto.GameInfo"%>
<%@page import="dao.GameInfoRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<!-- 한글 인코딩  -->
<%request.setCharacterEncoding("UTF-8");%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게임소프트웨어 졸업작품</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/mainbody.css" />

</head>

<body>
	<% 
		GameInfoRepository dao = GameInfoRepository.getInstance();
		ArrayList<GameInfo> listOfInfo = dao.getAllInfo();
	%>

	<main class="container">

		<!-- 소재목 -->
		<div class="pt-3 pb-2 mb-3">
			<h2 class="pt-3 pb-2 ">
				<a class="btn btn-outline-dark " href="GameWeb_Edit.html"
					style="float: right;">작품 등록</a>
				<p class="fs-3">
					<b>게임소프트웨어 졸업 작품 2022 </b><span class="fs-5 malgun"
						style="color: gray;">HoseoGameSoftWare</span>
				</p>
			</h2>
		</div>
		<!-- 소재목 -->

		<!-- 게임 목록 -->
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
			<%
				for(int i=0;i<listOfInfo.size();i++){
				GameInfo gameInfo = listOfInfo.get(i);
			%>
			<div class="col mb-5">
				<div class="card h-100">
					<a href="./GameWeb_Info.jsp?id=<%= gameInfo.getGameTitle()%>" style="text-decoration: none"> 
					<img class="card-img-top img-thumbnail"src="${pageContext.request.contextPath}/resources/images/<%= gameInfo.getGameTitleImage()%>">
						<div class="card-body p-4">
							<div class="text-center">
								<!-- 게임 제목 -->
								<h5 class="fw-bolder"><%= gameInfo.getGameTitle() %></h5>
								<!-- 게임 소개 -->
								<p><%=gameInfo.getGameTrailer() %></p>
							</div>
						</div>

						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto"  role="button"  href ="./GameWeb_Info.jsp?id=<%= gameInfo.getGameTitle()%>">
								게임소개</a>
							</div>
						</div>
					</a>
				</div>
			</div>
			
			<%}%>
			
		</div>
		
		<hr>

	</main>

	<!-- 푸터 학교 정보 -->
	<footer class="p-4 p-md-5" style="background: #303033">
		<div class="container">
			<small style="display: block; text-align: right; color: white";>과사무실
				: 아산캠퍼스 제1공학관 504-1호</small> <small
				style="display: block; text-align: right; color: white">전화:
				041-540-5696</small>
		</div>
	</footer>


</body>

</html>