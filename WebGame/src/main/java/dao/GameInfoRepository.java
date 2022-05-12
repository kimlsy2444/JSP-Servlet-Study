package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dbconn.DBConn;
import dto.GameInfo;

public class GameInfoRepository {
	
	private ArrayList<GameInfo> listOfInfo = new ArrayList<>();
	// GameInfoRepository인스턴스를 하나만 공유하게끔 싱글톤 패턴을 이용한다.
	

	
	private static GameInfoRepository instance = new GameInfoRepository();
	// DB 접속에 필요한 코드
	Connection conn = DBConn.getConnection(); 
	 
	  private PreparedStatement pstmt = null;
	  private ResultSet rs = null; 
	  private static String url = "jdbc:mysql://localhost:3306/WebGameDB"; 
	  private static String user ="WebGame"; private static String password = "1234";
	 
	
	
	// 인스턴스를 리턴하는 getter메서드
	public static  GameInfoRepository getInstance() {
		return instance;
	}
	
	
	public GameInfoRepository() {
		
	}
	
	public ArrayList<GameInfo> getAllInfo(){
		String sql = "select * from gameinfo";
	
		
	
		
		try {
			conn = getConnection(); // 커넥션 얻기
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); // DB에 저장되어 있는 상품 모두 가져와서 ResultSet에 담고 있다.
			
			while(rs.next()) {
				GameInfo gameInfo = new GameInfo();
				// 위의 빈 객체인 product에 각각 () db 에서 가져온 값을 저장하고 있다.
				
				gameInfo.setGameTeamname("gameTeamname");
				gameInfo.setGameMember1("gameMember1");
				gameInfo.setGameMember2("gameMember2");
				gameInfo.setGameMember3("gameMember3");
				gameInfo.setGameTitle("gameTitle");
				gameInfo.setGameDescription("gameDescription");
				gameInfo.setGameurl("gameurl");
				gameInfo.setGameTitleImage("gameTitleImage");
				gameInfo.setGameImage1("gameImage1");
				gameInfo.setGameImage2("gameImage2");
				gameInfo.setGameImage3("gameImage3");
				


				
				// ArrayList컬렉션에다가 product객체를 추가하고 있다
				listOfInfo.add(gameInfo);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(conn!= null) conn.close();
				System.out.println("DB연동 해제");
			} catch (Exception e2) {e2.printStackTrace();}
		}
		// 위에서 각 객체가 저장되어 ArrayList를 리턴하고 있다.
		return listOfInfo;
	}
		

	
	
	// listOfInfo에 저장된 모든 게임 정보목록을 조회를 해서 게임 타이틀 하고 일치하는 게임정보를 
	// 리턴을 해주는 메서드이다.
	public GameInfo getGameInfoById(String gameInfoId) {
		
		
		String sql = "select * from produc where p_id = ?";
		GameInfo gameinfoById = new GameInfo();
		
		try {
			conn = getConnection(); // 커넥션 얻기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,gameInfoId);
			
			// 인자값으로 넘어온 productId값에 해당하는 상품을 ResultSet객체에 하나만 저장될 것이다.
			rs = pstmt.executeQuery(); 
			
			if(!rs.next()) {
				return null;
			}
			// 인자값으로 넘어온 productId값이 있다면
			if(rs.next()) {
				gameinfoById.setGameTeamname("gameTeamname");
				gameinfoById.setGameMember1("gameMember1");
				gameinfoById.setGameMember2("gameMember1");
				gameinfoById.setGameMember3("gameMember1");
				gameinfoById.setGameTitle(rs.getString("gameTitle"));
				gameinfoById.setGameDescription(rs.getString("gameDescription"));
				gameinfoById.setGameurl(rs.getString("gameurl"));
				gameinfoById.setGameTitleImage(rs.getString("gameTitleImage"));
				gameinfoById.setGameImage1(rs.getString("gameImage1"));
				gameinfoById.setGameImage2(rs.getString("gameImage2"));
				gameinfoById.setGameImage3(rs.getString("gameImage3"));



			}		
			
		} catch (Exception e) { e.getMessage(); }
		
		finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				System.out.println("DB연동 해제");
			} catch (Exception e2) { e2.printStackTrace(); }			
		}		
		return gameinfoById;		

	}
		
	
	// 게임정보를 추가하는 역할을 하는 메서드
	public void addGameInfo(GameInfo GameInfo) {
		listOfInfo.add(GameInfo);
	}
	
	
	
	// Connection객체를 리턴하는 메서드(DB접속)
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver"); // 드라이버명
			conn = DriverManager.getConnection(url,user,password); // DB연결 객체를 얻고 있다
			System.out.println("DB연동 완료");
		} catch (Exception e) {
			System.out.println("DB연동 실패");
			System.out.print("실패 이유");
			e.printStackTrace();
		}
		return conn;
		
	}
	
	
	
	
}