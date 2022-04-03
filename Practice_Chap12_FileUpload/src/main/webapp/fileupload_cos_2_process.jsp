<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다중 업로드 처리</title>
</head>
<body>
	<%
		MultipartRequest multi = new MultipartRequest(request,
													 "C:\\upload", // 업로드 될 경로
													  1000*1024*1024, // 파일의 크기를 지정 1000MB
													  "utf-8", 		// 인코딩 방식
													  // 파일 이름에 대한 정책
													  // 덮어쓰는것이 아니라 동일한 이름의 파일이라면 새로운 파일로 만들어준다.
													  new DefaultFileRenamePolicy()
													  );
	
		// 각각 업로드 된 이름과 제목을 가져오고 있다.
		String name1 = multi.getParameter("name1");
		String title1 = multi.getParameter("title1");
		
		String name2 = multi.getParameter("name2");
		String title2 = multi.getParameter("title2");

		String name3 = multi.getParameter("name3");
		String title3 = multi.getParameter("title3");
		
		Enumeration files = multi.getFileNames();
		
		
		// 역순으로 업로드된 파일의 이름을 가져오고 있다.
		String file3 = (String)files.nextElement();
		String filename3 = multi.getFilesystemName(file3);

		String file2 = (String)files.nextElement();
		String filename2 = multi.getFilesystemName(file2);
		
		String file1 = (String)files.nextElement();
		String filename1 = multi.getFilesystemName(file1);
		
		%>
		
		<table border = "1">
			<tr>
				<th width = "100">이름</th>
				<th width = "100">제목</th>
				<th width = "100">파일</th>
			</tr>
			<%
				out.print("<tr><td>" +name1 + "</td>");
				out.print("<td>" +title1 + "</td>");
				out.println("<td>" +filename1 + "</td></tr>\n");
				
			%>
		</table>
		<br/>
		<%
		Enumeration files1 = multi.getFileNames();
			while(files1.hasMoreElements()){
				
				String name	= (String)files1.nextElement();
				String filename = multi.getFilesystemName(name); 	// 파일 이름 넣기
				String original = multi.getOriginalFileName(name);  // 이전파일 이름 얻기
				String type = multi.getContentType(name);			
				File file = multi.getFile(name); 					// 파일의 참초를 얻음
				
				out.println("요청 들어온 파라메터 이름 : " + name + "<br/>");
				out.println("실제 파일 이름 : " + original + "<br/>");
				out.println("저장 파일 이름 : " + filename + "<br/>");
				out.println("파일 컨텐츠 유형 : " + type + "<br/>");
				
				
				if(file != null){
					out.println("파일의 크기 : " + file.length() + "Kbyte"+"<br/>");
					out.println("파일의 경로 : " + file.getParent() + "<br/>");
				}
				out.println("-------------------------------------------------");
			}
	%>
</body>
</html>