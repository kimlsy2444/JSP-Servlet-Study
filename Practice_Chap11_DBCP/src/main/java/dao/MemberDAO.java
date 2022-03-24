package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;

public class MemberDAO {
	
	private DataSource dataSource;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private InitialContext context;
	private ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
	
	
	
	public MemberDAO() {
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + "jdbc/dbconn");
			conn = dataSource.getConnection();
			System.out.println("DBCP에 있는 커넥션 객체 얻어오기 성공");
			System.out.println("스레드명 : " + Thread.currentThread().getName());	}
		catch (Exception e) {	e.printStackTrace(); }	
		
		System.out.println("DAO 생성자 호출");
		System.out.println("스레드명 : " + Thread.currentThread().getName());
	}
	
//	public Connection getConnection() {
//		try {
//			context = new InitialContext();
//			dataSource = (DataSource)context.lookup("java:comp/env/" + "jdbc/dbconn");
//			conn = dataSource.getConnection();
//			System.out.println("DBCP에 있는 커넥션 객체 얻어오기 성공");
//			System.out.println("스레드명 : " + Thread.currentThread().getName());	}
//		catch (Exception e) {	e.printStackTrace(); }	
//	
//	
//	return conn;
//}
	
	// MemberDTO 테이블에 있는 데이터 리스트를 가져오는 메서드
	
	public ArrayList<MemberDTO> memberList() {
		
		try {
			String sql = "select * from MemberDTO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String username = rs.getString("username");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				
				MemberDTO dto = new MemberDTO(username, id, pw, phone1, phone2, phone3, gender);
				dtos.add(dto);
			}			
			
			
			System.out.println("DB에있는데이터 얻어오기");
			System.out.println("스레드명 : " + Thread.currentThread().getName());
			
			
			
		} catch (Exception e) {	e.printStackTrace();}

		return dtos;
	}
	
	// 신규 회원정보를 DB 및 ArrayList추가 저장 메서드
	public void addMember(MemberDTO dto){
		
		int n =0;
		try {
		String sql = "insert into MemberDTO values (?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,dto.getusername());
		pstmt.setString(2,dto.getId());
		pstmt.setString(3,dto.getPw());
		pstmt.setString(4,dto.getPhone1());
		pstmt.setString(5,dto.getPhone2());
		pstmt.setString(6,dto.getPhone3());
		pstmt.setString(7,dto.getGender());
		
		
		
		n  = pstmt.executeUpdate();
		System.out.println("삽입 갯수 : " +n);
		dtos.add(dto);
		
		}catch (Exception e) {	e.printStackTrace(); }
		
	}
	
	
}
