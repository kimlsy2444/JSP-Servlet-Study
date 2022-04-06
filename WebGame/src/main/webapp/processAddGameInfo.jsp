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

	String gameTitle = request.getParameter("gameTitle");
	String gameTrailer = request.getParameter("gameTrailer");
	String gameDescription = request.getParameter("gameDescription");
	String gameTitleImage = request.getParameter("gameTitleImage");
	String gameImage = request.getParameter("gameImage");
	String gameurl = request.getParameter("gameurl");

 	GameInfoRepository dao = GameInfoRepository.getInstance();
	GameInfo newgameInfo = new GameInfo();
	
	newgameInfo.setGameTitle(gameTitle);
	newgameInfo.setGameTrailer(gameTrailer);
	newgameInfo.setGameDescription(gameDescription);
	newgameInfo.setGameTitleImage(gameTitleImage);
	newgameInfo.setGameImage(gameImage);
	newgameInfo.setGameurl(gameurl);

	
	dao.addGameInfo(newgameInfo);
	
	// 강제로 페이지 이동을 시키고 있다.
	response.sendRedirect("GameWeb_Main.jsp");
%>



