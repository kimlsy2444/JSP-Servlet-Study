<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- 유즈빈을 사용하고 있다 -->
 <jsp:useBean id="member" class="sec01.MemberInfo" scope="page"/>
 <!-- jsp:setProperty액션 태그를 이용하여 member에 값을 저장하고 있다 -->
 <jsp:setProperty  name="member" property="name" value ="이준성" />
 <jsp:setProperty  name="member" property="id" value ="lee" />
 <jsp:setProperty  name="member" property="pw" value ="12345" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag and EL</title>
</head>
<body>
	<p>액션 태그 사용<br/>
	<p>이름 : <jsp:getProperty  name="member" property="name"/> 
	<p>아이디 : <jsp:getProperty  name="member" property="id"/> 
	<p>비밀번호: <jsp:getProperty  name="member" property="pw"/> 
	
	<p>El 표현 방법은 코도의 가독성과 아울러, 표기법을 가단해서 코드를 절약할수가 있다.
	<p>이름 : ${member.name}
	<p>아이디 : ${member.id}
	<p>비밀번호: ${member.pw}
</body>
</html>