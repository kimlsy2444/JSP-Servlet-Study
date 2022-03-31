<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- fmt태그 라이브러리를 사용하기 위해서 페이지 지시자를 통하여 uri를 설정함 -->
<%@ taglib prefix="fmt"  uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어처리 -fmt태그02(숫자)</title>
</head>
<body>
	<!-- 아래와 같이 setLocale태그를 이용하여 로케일을 정해주면 그에 맞는 숫자, 통화가 그 로케일에 
		 맞게끔 출력이 된다. -->
	<%-- <fmt:setLocale value="en_US"/> --%>
	<!-- fmt:formatNumber태그는 기본적으로 groupingUsed 속성이 true로 되어 있어서
	천자리에 ,로 구분되어진다. -->
	<p>숫자 : <fmt:formatNumber value="4545000" groupingUsed="true"/></p>
	<p>숫자 : <fmt:formatNumber value="4545000" type ="number"/></p> 
	<p>숫자 : <fmt:formatNumber value="4545000"  type ="number" groupingUsed="faluse"/></p> <!-- 천자리 구분 -->
	<p>숫자 : <fmt:formatNumber value="4545000" type ="currency"/></p> 
	<p>숫자 : <fmt:formatNumber value="4545000" type ="currency" currencySymbol="원"/></p> 
	<p>숫자 : <fmt:formatNumber value="0.45" type ="percent"/></p> 
	
	<!-- minIntegerDigits는 최대 자릿수를 의미함. minFractionDigits은 소수점 자리를 나타냄 -->
	<p>숫자 : <fmt:formatNumber value="4545000" minIntegerDigits="10" minFractionDigits="2"/></p> 
	
	<!-- 0은 자리수를 자지하고 #은 있으면 출력 없으면 출력하지 않는다. -->
	<p>숫자 : <fmt:formatNumber value="4545000.12" pattern ="000000000.000"/></p>
	<p>숫자 : <fmt:formatNumber value="4545000.12" pattern ="#########.###"/></p>
	 
	<p>숫자 : <fmt:formatNumber value="4545000.12" pattern ="#,###.###"/></p> 
	
</body>
</html>