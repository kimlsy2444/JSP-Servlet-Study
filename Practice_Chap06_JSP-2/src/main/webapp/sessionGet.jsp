<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 값 확인</title>
</head>
<body>
	<%
		// 지금은 하나하나의 Name을 주고 Value을 얻어서 출력하는 경우이다.
		// session의 getAttribute()의 반환타입은 Object타입이라
		// 강제로 다운캐스팅 하였다.
		Object obj1 =  session.getAttribute("abcde"); //속성값 얻기
		Integer intValue = (Integer)obj1;	 // 다운케스팅
		out.println("abcde : "+ intValue);	// 출력
		
		Object obj2 =  session.getAttribute("feed");	
		String str2 = (String)obj2;
		out.println("feed : "+ str2);
	%>
	<br/>
	<%	
		out.print("==============================================="+"<br/>");
	
		String sName;
		String sValue;
		
		// getAttribute()의 반환값은Enumeration<String> 열거형 제네릭 타입이다.
		// 여기서 String만 받도록 제네릭 타입을 설정했다.
		// getAttributeNames()의 세션의 설정되어있는 모든 Name값을 다 얻어오는 것이다
		Enumeration<String> en = session.getAttributeNames();
		// 가져올 데이터 확인
		while(en.hasMoreElements()){
			sName = en.nextElement(); // 데이터 가져옴
			sValue = session.getAttribute(sName).toString();
			out.println("sName : "+  sName + "<br/>");
			out.println("sValue : "+  sValue + "<br/>");
		}
		out.print("==============================================="+"<br/>");

		// sestionID는 웹브라우저 하나당 생기는 유니크한 값이다. 물론 서버에서 생성해준다.
		String sessionID =	session.getId();
		out.println("sesstionID : "+session+"<br/>");
		
		// session의 유효시간은 기본적으로 30분이다.
		// 설정을 바꾸고 싶다면 tomcam9\conf\web.xml 을 열어 
		// session부분의 값을 변경하면 된다.
		int sesstionInterval = session.getMaxInactiveInterval();
		out.println("세션 유효시간(초) : " +sesstionInterval+"<br/>");
		
		out.print("==============================================="+"<br/>");

		//abcde세션의 특정한 값을 삭제하는 코드이다.
		session.removeAttribute("abcde");
		
		Enumeration<String> en1 = session.getAttributeNames();
		// 가져올 데이터 확인
		while(en1.hasMoreElements()){
			sName = en1.nextElement(); // 데이터 가져옴
			sValue = session.getAttribute(sName).toString();
			out.println("sName : "+  sName + "<br/>");
			out.println("sValue : "+  sValue + "<br/>");
		}
		out.print("==============================================="+"<br/>");
		
		// 세션의 모든 값들을지운다.
		session.invalidate();
		
		// 유효한 세션 id 확인
		if(request.isRequestedSessionIdValid()){
			out.print("sesstion valid");
		}
		else { // 없으면 출력
			out.print("sesstion Invalid");
		}
		
	%>
</body>
</html>