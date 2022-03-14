<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 속성 읽기</title>
</head>
<body>
	<h1>쿠키의 속성들의 내용을 읽는 cookieGet.jsp페이지 입니다.</h1>
	<%
		System.out.println("서버에서 쿠키를 생성하였으며, 생성된 쿠키의 값을 출력해봅니다.");
		// 요청들어오는 쿠키들의 값들을 받고있다.
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName(); // 쿠키의 이름 얻는다.
			String value = cookies[i].getValue(); // 쿠키의 값을 얻는다

			// 쿠키값 확인
			if(name.equals("abcde")){
				out.println("cookies["+i+"] name : "+ name);
				out.println("<br/>");
				out.println("cookies["+i+"] value : "+ value);
			}
			
		}
	%>
	<br/><br/>
	<a href="cookieDel.jsp">쿠키 삭제 페이지</a>
		
</body>
</html>