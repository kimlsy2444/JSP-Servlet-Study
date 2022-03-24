<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file upload(cos.jar)</title>
</head>
<body>
	<!-- enctype속성 : 전송타입을 설정, 파일을 전송하기 위해서는 반드시 multipart/form-data로 지정해준다.  -->
	<form name = fileForm" action = "fileupload_cos_1_process.jsp" method="post"
		  enctype="multipart/form-data" >
		  <p><b>이 름 : </b> <input type ="text" name = "name"/>
		  <p><b>제 목 : </b> <input type ="text" name = "title"/>
		  <p><b>파 일 : </b> <input type ="file" name = "filename"/>
		  
		  
		  <p> <input type ="submit" value = "파일 업로드"/>
		  
		  
	</form>
</body>
</html>