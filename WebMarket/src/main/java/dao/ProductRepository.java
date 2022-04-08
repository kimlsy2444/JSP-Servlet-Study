package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	// ProductRepository인스턴스를 하나만 공유하게끔 싱글톤 패턴을 이용한다.
	
	private static ProductRepository instance = new ProductRepository();
	
	// DB 접속에 필요한 코드
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static String url = "jdbc:mysql://localhost:3306/WebMarketDB";
	private static String user = "root";
	private static String password = "1234";
	
	
	
	
	// 인스턴스를 리턴하는 getter메서드
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		/* 과거 직접입력한 부분 DB 접속해서 가져오기 */
	}
	
	// 모든 상품 정보를 넘겨주는 getter메서드
	public ArrayList<Product> getAllProducts(){
		String sql = "select * from product";
		
		try {
			conn = getConnection(); // 커넥션 얻기
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); // DB에 저장되어 있는 상품 모두 가져와서 ResultSet에 담고 있다.
			
			while(rs.next()) {
				Product product = new Product();
			
				// 위의 빈 객체인 product에 각각 () db 에서 가져온 값을 저장하고 있다.
				product.setProductId(rs.getString("p_id"));
				product.setPname(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitPrice"));
				product.setDescription(rs.getString("p_description"));
				product.setCategory(rs.getString("p_category"));
				product.setUnitsInStock(rs.getLong("p_unitsInStock"));
				product.setCondition(rs.getString("p_condition"));
				product.setFilename(rs.getString("p_filename"));
				
				// ArrayList컬렉션에다가 product객체를 추가하고 있다
				listOfProducts.add(product);
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
		return listOfProducts;
	}
	
	
	// listOfProducts에 저장된 모든 상품 목록을 조회를 해서 상품아이디하고 일치하는 상품을 
	// 리턴을 해주는 메서드이다.
	public Product getProductById(String productId) {
		
		String sql = "select * from produc where p_id = ?";
		Product productById = new Product();
		
		try {
			conn = getConnection(); // 커넥션 얻기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,productId);
			
			// 인자값으로 넘어온 productId값에 해당하는 상품을 ResultSet객체에 하나만 저장될 것이다.
			rs = pstmt.executeQuery(); 
			
			if(!rs.next()) {
				return null;
			}
			// 인자값으로 넘어온 productId값이 있다면
			if(rs.next()) {
				productById.setProductId(rs.getString("p_id"));
				productById.setPname(rs.getString("p_name"));
				productById.setUnitPrice(rs.getInt("p_unitPrice"));
				productById.setDescription(rs.getString("p_description"));
				productById.setCategory(rs.getString("p_category"));
				productById.setUnitsInStock(rs.getLong("p_unitsInStock"));
				productById.setCondition(rs.getString("p_condition"));
				productById.setFilename(rs.getString("p_filename"));
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
		return productById;		

	}
	
	// 상품을 추가하는 역활을 하는 메서드
	public void addProduct(Product product) {
		listOfProducts.add(product);
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



