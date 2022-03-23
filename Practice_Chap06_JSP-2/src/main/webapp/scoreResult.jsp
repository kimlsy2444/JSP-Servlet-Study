<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String strScore = request.getParameter("score");
	
	// post 방식으로 보낼때 값늘 session저장하여 다른 페이지로 이동할 때 파라메터값을 넘겨야 한다.
	pageContext.getSession().setAttribute("name",name);
	pageContext.getSession().setAttribute("score",strScore);
	
	
	// 현재 페이지에서 다른 페이지로 넘기고 싶을때는 한글일 경우를 대비해서 아래와 같이 인코딩을 써야한다.
	// get 방식
	// 	String encodName = URLEncoder.encode(name,"UTF-8");
	
	int score = Integer.parseInt(request.getParameter("score"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점수 확인</title>
</head>
<body>
	<%	if(score < 0 || score > 100){
		out.println("<h1>점수를 잘못 입력하셨습니다.</h1>");
 		out.println ("<a href=score.html>점수입력창으로이동</a>");
 		return;
	}
	%>
	<%
		// score점수에 따라 페이지 이동이  달라지는 코드이다.
		if(score >= 60){
			// 60점 이상 이동
			System.out.println("screResult.jsp 페이지를 지나갔습니다.");
			// get
			// response.sendRedirect("pass.jsp?name="+encodName+"&score=" +strScore);
			
			// post
			response.sendRedirect("pass.jsp");
		}
		else{
			// 60점 미만 이동
			System.out.println("screResult.jsp 페이지를 지나갔습니다.");
			// get
			//response.sendRedirect("notPass.jsp?name="+encodName+"&score=" +strScore);
			
			// post
			response.sendRedirect("notPass.jsp");
		
		}
	%>
</body>
</html>