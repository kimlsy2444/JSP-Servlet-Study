<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String pagefile = request.getParameter("page");
	if(pagefile == null){
		System.out.print("페이지 검사 지나감");
		pagefile = "newitem";
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>템플릿 페이지</title>
<style>
	table{
		margin : auto;
		width : 1024px;
		height: 768px;
		color: gray;
		border: 2px red;
	}
</style>
</head>
<body>
	<table border = "1">
		
		<tr> <!-- top-->
			<td height ="15%" width ="20" align="center">쇼핑몰 로고</td>
			<td height ="15%" colspan="2" align="right">
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		
		<tr> <!-- left -->
			<td  width ="20%" align="right" valign="top"><br/>
				<jsp:include page="left.jsp"/>
			</td>
			<!-- center -->
			<td colspan="2" align="center">
				<jsp:include page='<%= pagefile+".jsp"%>'/>
			</td>			
		</tr>	
		
		<tr> <!-- bottom-->
			<td  width ="100%" height="10%"colspan="3" align="center">
				<jsp:include page="bottom.jsp"/>
			</td>
		</tr>	
	</table>
</body>
</html>