package sec04_exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServelt
 */
@WebServlet("/Login")
public class LoginServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("doGet메서드 호출됨");
//		// 클라이언트가 요청한 파라메터 값들을 인코딩 설젛애주는 코드
//		request.setCharacterEncoding("UTF-8");
//		// 클라이언트에게서 넘어오는 아이디,비밀번호값을 받고 인코딩 설정후 출력스트림을 얻고 화면에 뿌린다.
//		String id = request.getParameter("id");
//		String passwd = request.getParameter("password");
//		
//		response.setContentType("text/html; charset=utf-8");
//		PrintWriter writer = response.getWriter();
//		writer.println("아이디 : " +id+"<br/>");
//		writer.println("비밀번호 : " +passwd+"<br/>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost메서드 호출됨");
		// 클라이언트가 요청한 파라메터 값들을 인코딩 설젛애주는 코드
		request.setCharacterEncoding("UTF-8");
		// 클라이언트에게서 넘어오는 아이디,비밀번호값을 받고 인코딩 설정후 출력스트림을 얻고 화면에 뿌린다.
		String id = request.getParameter("id");
		String passwd = request.getParameter("password");
		
		// 클라이언트에게 뿌려주는 화면이 되는 코드
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("아이디 : " +id+"<br/>");
		writer.println("비밀번호 : " +passwd+"<br/>");
	}

}
