<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
	<%!
		String id, pw;
	%>
	<%
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		//지금은 DB를 설정하지 않아서 아래와 같이 코드를 작성하였지만, 추후 DB연동하고 난 뒤에는
		//아래와 같이 하는 코드를 쉽게 변경할 수 있다.
		if(id.equals("abcde") && pw.equals("12345")){
			//쿠키의 이름은 id이고 값은 abcde가 될 것이다.
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60); //유효기간 설정
			response.addCookie(cookie);
			//로그인에 성공하면 sendRedirect()를 이용하여 login_sucsess.jsp파일로 이동시키고 있다.
			response.sendRedirect("login_sucsess.jsp");			
		}
		else{
			//로그인에 실패하면 sendRedirect()를 이용하여 login_fail.jsp파일로 이동시키고 있다.
			response.sendRedirect("login_fail.jsp");
		}	
	%>

</body>
</html>