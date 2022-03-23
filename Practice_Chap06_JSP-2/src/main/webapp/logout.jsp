<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
		<%
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				String id = cookies[i].getValue(); //실제 아이디 값을 얻는 코드이다.
				
				if(id.equals("abcde")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]); // 쿠키가 변경되었으니 다시 탑재함
					out.print(id+"님이 로그아웃 하셨습니다.");
				}
			}	
		}
	%>
	<br/><br/>
	<a href="cookieTest.jsp">쿠키 확인</a>
</body>
</html>