<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.GameInfo"%>
<%@ page import="dao.GameInfoRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

    
<%
	request.setCharacterEncoding("utf-8");
	// addProduct.jsp에서 사용자가 업로드한 이미지 부분을 저장을 하고 있다.
	String filename = "";

	// ** 중요함 **
	// 사용자가 추가한 상품들의 이미지를 현재 프로젝트 images폴더로 잡아서 저장을 해야지
	// 진정한 서버의 역활을 함과 동시에 아울러 이미지를 뿌려줄때 이미지를 가지고 오는데 문제가 없다.
	
	String realFolder = "D:/JSP-Servlet작업/WebMarket/src/main/webapp/resources/images";
	int maxSize = 10 * 1024 * 1024; // 최대 업로드 크기 (10m)
	String encType = "utf-8"; // 인코딩 유형
	
 	MultipartRequest multi = new MultipartRequest(request, realFolder, 
							 maxSize,encType, new DefaultFileRenamePolicy()); 

	// addProduct.jsp에서 사용자가 입력한 부분을 받아서 저장을 하고 있다.
	String gameTitle = multi.getParameter("gameTitle");
	String gameTrailer = multi.getParameter("gameTrailer");
	String gameDescription = multi.getParameter("gameDescription");
	String gameTitleImage = multi.getParameter("gameTitleImage");
	String gameImage = multi.getParameter("gameImage");
	String gameurl = multi.getParameter("gameurl");

	

	
	
	
	
 	Enumeration files = multi.getFileNames(); 
 	String fname = (String)files.nextElement(); 
 	String fileName = multi.getFilesystemName(fname); 
	
 	GameInfoRepository dao = GameInfoRepository.getInstance();
	GameInfo newgameInfo = new GameInfo();
	
	//Prodcuct객체에 사용자가 입력한 내용을 저장하고 있다.
	newgameInfo.setGameTitle(gameTitle);
	newgameInfo.setGameTrailer(gameTrailer);
	newgameInfo.setGameDescription(gameDescription);
	newgameInfo.setGameTitleImage(gameTitleImage);
	newgameInfo.setGameImage(gameImage);
	newgameInfo.setGameurl(gameurl);

	
	
	// 이미지 저장 부분
	
	// ArrayList에 새 상품을 추가하고 있다.
	dao.addGameInfo(newgameInfo);
	
	// 강제로 페이지 이동을 시키고 있다.
	response.sendRedirect("GameWeb_Main.jsp");
	

%>

