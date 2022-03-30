<%@page import="sec02.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<%
	request.setCharacterEncoding("utf-8");
%>
<!-- useBean액션태그를 이용하여 컬랙션 객체들을 가지고 왔다. -->

<jsp:useBean id ="membersList" class="java.util.ArrayList" />
<jsp:useBean id ="membersMap" class="java.util.HashMap" />


<%
	membersMap.put("id", "lee");
	membersMap.put("pw", "1234");
	membersMap.put("name", "이준성");
	membersMap.put("email", "kimlsy2444@naver.com");
	
	// 멤버 객체를 생성
	Member member1 = new Member("An","1234","안정환","an@naver.com");
	Member member2 = new Member("Cha","1234","차두리","cha@naver.com");
	
	// ArryList에 객체를 추가하고 있다.
	membersList.add(member1);
	membersList.add(member2);
	
	membersMap.put("membersList",membersList);
%>
<!-- 변수 membersList에 membersMap.membersList값으로 저장되어짐. -->
<c:set var = "membersList" value="${membersMap.membersList }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL라이브러리 set태그-bean활용</title>
</head>
<body>
	<table border ="1">
		<tr align="center" bgcolor ="yellow">
			<td width = "20%"><b>아이디</b></td>
			<td width = "20%"><b>비밀번호</b></td>
			<td width = "20%"><b>이름</b></td>
			<td width = "20%"><b>이메일</b></td>		
		</tr>
		
		<!-- 아래 한 행은 HashMap에 직접 저장한 것을 출력함 -->
		<tr align="center">
			<td>${membersMap.id}</td>
			<td>${membersMap.pw}</td>
			<td>${membersMap.name}</td>
			<td>${membersMap.email}</td>
		</tr>
		
		<!-- 아래 두 행은 ArrayList에 저장된 객체이다. 하지만 2개의 객체를 다시 HashMap에 저장을 한다. -->
		<tr align="center">
			<td>${membersList[0].id}</td>
			<td>${membersList[0].pw}</td>
			<td>${membersList[0].name}</td>
			<td>${membersList[0].email}</td>
		</tr>
		
		<tr align="center">
			<td>${membersList[1].id}</td>
			<td>${membersList[1].pw}</td>
			<td>${membersList[0].name}</td>
			<td>${membersList[1].email}</td>
		</tr>
	</table>
</body>
</html>