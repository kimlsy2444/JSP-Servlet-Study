<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>관리자 코드 등록</title>
<style>
body {
	background: #eaeaea;
}
</style>

<link href="../resources/css/form-validation.css" rel="stylesheet">
</head>

<body>
	<main class="container mt-5">
		<!-- 이미지 유튜브 업로드 -->
	<form  method="post" class="needs-validation"  action="Admin_ProcessAddCode.jsp"  novalidate>
		<!-- 졸작 소개 텍스트 창 -->
		<h4>
			<span class="badge bg-secondary rounded-pill  text-center">코드 등록</span>
		</h4>
		  <div class="row gx-5">
			<input type='text'class='form-control' name ="gameCode" value="" required> 
		</div>
				

		<div class="pt-3 pb-3">
			<input  class="w-20 btn btn-outline-dark " type="submit" value="코드 등록"/>
			<a href="Admin_Main.jsp"class="w-20 btn btn-outline-danger ">작품 취소</a>
		</div>
		</form>
	</main>
	<script src="../resources/js/form-validation.js"></script>
	
	
</body>

</html>