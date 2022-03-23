<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 확인</title>
</head>
<body>
	<h1>쿠키의 속성이 삭제된 것을 확인하는 cookieTest.jsp페이지 입니다.</h1>
	<%
		System.out.println("삭제된 쿠키의 값을 출력해봅시다.");
		// 쿠키의 유효시간이 0으로 설정된 쿠키가 리턴된다.
		Cookie[] cookies = request.getCookies();
		
		
		// 확인해보니 남아있는 쿠키 이름 : JSESSIONID 
		// 남아있는 쿠키 값 : D23561A0F20D2BAB570FD52B4837D660 
		// 위의 이름과 같은 값은 무시하면된다(서버에서 생성되는 부분이기 때문 항상 출력되는 부분)
		if(cookies != null){
			for(int i = 0; i<cookies.length; i++){
				out.println("남아있는 쿠키 이름 : "+ cookies[i].getName());
				out.println("남아있는 쿠키 값 : "+ cookies[i].getValue());

			}
		}
		// 여기서 반드시 기억 해야 할 것은, 쿠키를 생성하고 response객체에 탑재를 해주어야 한다.
		// 아울러 변경이 일어나면 반드시 response객체에 재탑재를 해주어야 한다.
		// 그래야 쿠키값이 일관성 있게 유지가 되는 것이다.
	%>
	<br/><br/>
		
</body>
</html>