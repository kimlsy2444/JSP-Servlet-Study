<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<!-- 한글 인코딩  -->
<%
request.setCharacterEncoding("UTF-8");
String gameCode = (String) session.getAttribute("gameCode");
%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/mainbody.css" />

<style>
a { text-decoration:none }

a:link {
	color: white;
	text-decoration: none;
}

a:visited {
	color: white;
	text-decoration: none;
}

a:hover {
	color: white;
	text-decoration: none;
}


</style>
<script type="text/javascript">

function delchk(){
    return confirm("삭제하시겠습니까?");
}
</script>

</head>
<body>
<%@ include file = "../dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	int count = 1;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String sql = "select gameCode,gameTeamname from GameInfo Info ORDER BY gameCode asc;";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

%>
<main class="container">
	<div class="pt-3 pb-2 mb-3">
		<table class="table caption-top">
		  <caption>List of Code &nbsp;&nbsp;&nbsp; <a class = "btn badge bg-success" href ="Admin_AddCode.jsp">코드추가</a> <a class = "btn badge bg-info" href ="../GameWeb_Main.jsp">메인화면</a></caption> 
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">GameCodeList</th>
		      <th scope="col">팀명</th>
		      <th scope="col">삭제</th>
		    </tr>
		  </thead>
		  <tbody>
		    <%while (rs.next()) { 
		    	if(rs.getString("gameCode").equals("ad9538")){
		    		continue;
		    	}
		    %>
		    <tr>
		      <th scope="row"><%=count++%></th>
		      <td><%=rs.getString("gameCode")%></td>
		      <td><%=rs.getString("gameTeamname")%></td>
		      <td class="w-20 btn"><a class=" btn badge bg-danger"   href = "Admin_DelCode.jsp?gameCode=<%= rs.getString("gameCode")%>"  onclick="return delchk();" >삭제</a></td>
		    </tr>
		  <%}%>
		  </tbody>
		</table>
	</div>
<script>

</script>
</main>
</body>
</html>

