<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>


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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="./resources/libs/jquery.MultiFile.min.js"></script>
<script src="./resources/js/img-exception.js"></script>
<script src="./resources/js/addinputbox.js"></script>
<script src="./resources/js/form-validation.js"></script>
<script src="./resources/js/thumbnail.js"></script>
</head>

<%@ include file = "dbconn.jsp" %>
<!-- null 이면 빈공백 출력 함수  -->
<%!
public static String checkNull(String str) {
	return (str == null || str.equals("")) ? "" : str;
}
%>

<body>
<% 	
	int i = 1;
	//어떤 제품을 편집할지 id값이 넘어오는 것을 받고 있다.
	String gameCode = request.getParameter("gameCode");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from GameInfo where gameCode = ?";
	//Connection객체로 부터 쿼리문를 주고 PreparedStatement를 얻고 있다.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gameCode);
	
	//쿼리문의 결과를 받아오고 있다.
	rs = pstmt.executeQuery();
	
	System.out.println(gameCode);

	if(rs.next()) {
%>
   
<main class="container mt-5">
	<!-- 이미지 유튜브 업로드 -->
	<form  method="post" class="needs-validation"  action="./processAddGameInfo.jsp"   
		  enctype="multipart/form-data" novalidate>
    <input type="hidden" id="gameCode" name="gameCode" value="<%=gameCode %>"> 
		<!-- 졸작 소개 텍스트 창 -->
		<h4>
			<span class="badge bg-secondary rounded-pill  text-center">졸업작품 업로드</span>
		</h4>
		<div class="col-sm-12">
			<label class="form-label"></label> <input type="text"
				class="form-control" name="gameTitle" placeholder="게임 제목" value="<%= checkNull(rs.getString("gameTitle"))%>"
				required>
		</div>
		<!-- 팀명 -->
		<div class="col-sm-12">
			<label class="form-label"> </label> 
			<input type="text"
				class="form-control" name="gameTeamname" placeholder="팀명" value="<%= checkNull(rs.getString("gameTeamname"))%>"required>
		</div>
		<label class="form-label"> </label> 
		<!-- 팀명 -->
		
		<!-- 인원 추가 -->
		<div class="col-sm-12">
			<input type="button" class="pt-1 mb-3 btn btn-outline-success" id="btn1" name="btn1" value="추가">
			<input type="button" class="pt-1 mb-3 btn btn-outline-danger"  id="btn2" name="btn2" value="삭제">
			<div>
			
				<% if (rs.getString("gameMember"+i) ==null){ %><div id="div_chk" class="row row-cols-4"></div><%} %>
				<% if (rs.getString("gameMember"+i) !=null){ %>
				
				<div id="div_chk" class="row row-cols-4"><%} %>
					<% while(rs.getString("gameMember"+i) !=null) {%>
					<div id='id_chk'>
						<input type='text' class='form-control' name="<%= rs.getString("gameMember"+i)%>" value="<%=rs.getString("gameMember"+i)%>" required>
					</div>
	
					<% 
						i++; 
						if( i==4)break; 
					}
				 	%>
				</div>
			</div>
		</div>
		<!-- 인원 추가 -->
		
		<!-- 게임 소개 -->
		<div class="col-12">
			<label class="form-label"></label>
			<div class="input-group has-validation">
				<textarea class="form-control" name="gameDescription" style=" height: 400px;"
					placeholder="게임 소개" value=""required><%= checkNull(rs.getString("gameDescription"))%></textarea>
			</div>
		</div>
		<hr class="my-4">
		<!-- 게임 소개 -->


		<!--  유튜브 업로드 -->
		<h4 class="d-flex justify-content-between ">
			<span class="badge bg-secondary rounded-pill  text-center">게임 소개 영상 업로드</span>
		</h4>
		<div class="input-group pt-2 pb-3">
			<input type="text" name="gameurl" class="form-control " value="<%= checkNull(rs.getString("gameurl"))%>"
				required placeholder="게임 소개 영상">
		</div>
		<!--  유튜브 업로드 -->
		<!-- 이미지 등록 -->
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
		                              <div id="image_container" class="card-img-top">
		                              <%
		                          			if(rs.getString("gameTitleImage") != null) {	%>
		                          			<img alt="" src="./resources/images/<%= rs.getString("gameTitleImage")%>">
		                              <%}%>
		                              		
		                              </div>
		                          </div>
		                      </div>
		                  </tr>
		              </table>
		          </div>
		          <div class="input-group pt-2">
		              <input id ="image" class="form-control" type="file" name="gameTitleImage"value=""required
		                     onchange="addFile(this); setThumbnail(event);" accept="image/gif, image/jpeg, image/png"> 
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
             							<%	 i = 1; 
											while(rs.getString("gameImage"+i) != null) {	%>
												
												<img src="./resources/images/<%= rs.getString("gameImage"+i)%>">
											
											<%i++;
											if(i == 4){
												
												break;
											}
												
											} 
									%>
		                              </div>
		                          </div>
		                      </div>
		                  </tr>
		              </table>
		          </div>
		          <div class="input-group pt-2">
		              <input id ="images" class="form-control" type="file" name="gameImage" value=""required multiple
		                  onchange="addFile(this); setDetailImage(event);" accept="image/gif, image/jpeg, image/png">
		          </div>
		      </div>
           	<!-- 썸네일 이미지 등록 및 미리보기 -->
		</div>
		<!-- 이미지 등록 -->
		
		<div class="pt-3 pb-3">
			<input  class="w-20 btn btn-outline-dark " type="submit" value="작품 등록"/>
			<a href="GameWeb_Main.jsp"class="w-20 btn btn-outline-danger ">작품 취소</a>
		</div>
	</form>
</main>

	
	<%}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();	
	%>
	
</body>

</html>