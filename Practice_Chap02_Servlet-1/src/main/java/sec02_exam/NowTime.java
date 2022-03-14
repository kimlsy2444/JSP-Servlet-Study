package sec02_exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NowTime
 */
@WebServlet("/NowTime")
public class NowTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public NowTime() {
    	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문자셋 지정
		response.setContentType("text/html; charset=utf-8");
		
		// 서블릿은 JSP 표준 이전에 등장한 표준이다. 물론 자바웹어플리케이션 개발을 목적으로 말이다.
		// 하여 지금까지 살펴본 web.xml매핑과 어노테이션 매핑방법이 있는ㄷ,
		// 어노테이션 매핑을 하게 되면 프로그램ㅇ 개발을 완성한 후 릴리즈를 했는데 수정시에 자바소스파일
		// 수정을 해야되고 아울러 재컴파일을 계속 하게 될 것이다. 유지보수가 매우 힘들어진다.
		// web.xml을 이용해서 매핑하는 방법이 낫긴 하지만, 이건 경우에 따라서 각각 다르게 구현이 되어야 한다.
		
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>현재시간</TITLE>");
		out.println("<BODY>");
		out.println("<H1>지금 시간</H1>");
		out.println(new Date());
		out.println("입니다.");
		out.println("</BODY>");
		out.println("</HTML>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
