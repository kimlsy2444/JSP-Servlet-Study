<%@page import="java.util.Enumeration"%>
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
		request.setCharacterEncoding("UTF-8");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		//지금은 DB를 설정하지 않아서 아래와 같이 코드를 작성하였지만, 추후 DB연동하고 난 뒤에는
		//아래와 같이 하는 코드를 쉽게 변경할 수 있다.
		if(id.equals("김연아") && pw.equals("12345")){
			// 세션으로 로그인 정보를 제공하고 있다.
			session.setAttribute("id",id);
			System.out.println("session_LoginOk.jsp파일 가져감");
			// 아이디 비번이 맞다면  session_login_sucsess.jsp파일로 이동시키고 있다.
			response.sendRedirect("session_login_sucsess.jsp");			
		}
		else{
			//로그인에 실패하면 sendRedirect()를 이용하여 session_login_fail.jsp파일로 이동시키고 있다.
			System.out.println("session_LoginOk.jsp파일 가져감 실패");

			response.sendRedirect("session_login_fail.jsp");
		}	
	%>

</body>
</html>