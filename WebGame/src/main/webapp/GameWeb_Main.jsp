<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URI"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.GameInfo"%>
<%@page import="dao.GameInfoRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<!-- 한글 인코딩  -->
<%
request.setCharacterEncoding("UTF-8");
%>
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

<style type="text/css">
a:link {
	color: black;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<%
	session.invalidate(); // 다시 오면 코드입력 초기화 하도록
	%>
	<main class="container">
		<%@ include file="dbconn.jsp"%>
		<!-- 소재목 -->
		<div class="pt-3 pb-2 mb-3">
			<h2 class="pt-3 pb-2 ">

				<a class="btn btn-outline-dark " href="GameWeb_Registration.jsp"
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
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select * from gameinfo";
			// Connection 객체로 부터 쿼리를 주고 PreparedStatement 얻고있다.
			pstmt = conn.prepareStatement(sql);

			// 쿼리문의 결과를 받아오고 있다.
			rs = pstmt.executeQuery();

			while (rs.next()) {
			%>
			<div class="col mb-5">
				<div class="card h-100 p-2">
					<a href="./GameWeb_Info.jsp?id=<%=rs.getString("gameTitle")%>"
						style="text-decoration: none"> <img
						class ="card-img-top img-thumbnail" src="./images/<%= rs.getString("gameTitleImage")%>">

						<div class="card-body p-4">
							<div class="text-center">
								<!-- 게임 제목 -->
								<h5 class="fw-bolder"><%=rs.getString("gameTitle")%></h5>
							</div>
						</div>
						<div class="text-center card-footer p-4 pt-0 border-top-0 bg-transparent">
							<a class="btn btn-outline-dark" role="button"
                              href="./GameWeb_Info.jsp?id=<%=rs.getString("gameTitle")%>">게임소개</a>
						</div>
					</a>
				</div>
			</div>
			<%}%>
		</div>
		<hr>
	</main>
</body>

</html>