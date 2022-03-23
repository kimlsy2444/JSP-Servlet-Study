<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>
	<h1>쿠키의 속성을 삭제하는 cookieDel.jsp페이지 입니다.</h1>
	<%
		System.out.println("서버에서 쿠키를 삭제");
		// 요청들어오는 쿠키들의 값들을 받고있다.
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i<cookies.length; i++){
			String name = cookies[i].getName(); // 쿠키의 이름 얻는다.
			String value = cookies[i].getValue(); // 쿠키의 값을 얻는다

			// 쿠키값 확인
			if(name.equals("abcde")){
				out.println("cookies["+i+"] name : "+ name);
				cookies[i].setMaxAge(0); // 유효기간을 0초로 설정하면 삭제와 동일한 효과
				out.println("<br/>");
				out.println("cookies["+i+"] value : "+ value);
				// 위에 코드에서 쿠키의 수정이 있었으므로 다시 response객체에 쿠키를 추가한다.
				response.addCookie(cookies[i]);
			}
			
		}
	%>
	<br/><br/>
	<a href="cookieTest.jsp">쿠키 삭제 확인 페이지</a>
		
</body>
</html>