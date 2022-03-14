package sec_exam02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class initParam
 */
//두 번째 방법
//아래와 같이 어노테이션을 적용하기 위해서는 web.xml에 기술되어 있는 부분을 일단 주석처리를 한다.
//주석 처리를 해야 아래코드가 적용이 된다.어노테이션을 이용을 해서 직접 초기화 파라메터 값을 지정하였다.
//@WebServlet(urlPatterns = {"/IP"}, 
//			initParams = {
//					@WebInitParam(name = "id", value="admin"),
//					@WebInitParam(name = "pw", value="1234abcd!!"),
//					@WebInitParam(name = "path", value="C://Temp")					
//			})


//결론은 초기화 파라메터를 사용하는 곳은, 보통 관리자 계정을 많이 사용을 하고, 통상 web.xml파일에 기술을 하는것이
//바람직하다.
public class initParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public initParam() {
        super();       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet호출");
				
		//상속 계층도를 쉽게 볼려면 Ctrl+T를 이용하면 된다.
		//ServletConfig(인터페이스)의 추상메서드를 HttpServlet클래스에서 구현하였다.
		//현재 this는 자기 자신의 주소를 가지고 있다라는 것이 이미 자바에서 배웠다.
		//getInitParameter()는 HttpServlet클래스에 조상클래인 GenericServlet클래스에
		//선언된 메서드이므로 자손클래스에서 얼마든지 사용을 할 수가 있다.
		String id = this.getInitParameter("id");
		String pw = this.getInitParameter("pw");
		String path = this.getInitParameter("path");		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><head></head><body>");
		out.println("아이디 : " + id + "<br/>");
		out.println("비밀번호 : " + pw + "<br/>");
		out.println("경로 : " + path + "<br/>");
		out.println("</body></html>");
		
		out.close();		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
