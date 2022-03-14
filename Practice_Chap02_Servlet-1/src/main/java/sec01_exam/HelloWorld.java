package sec01_exam;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// javax.servlet패키지에 오류가 발생하면, 프로젝트 우클릭으로 bulid path -> libraries -> add external jars
// -> 톰캣폴더\lib\ ->찾기 (jsp_api.jar, serviet_api.jar추가를 하면됨)
/**
 * Servlet implementation class HelloWorld
 */
// URL 매핑코그가 @WebServlet 어노테이션에 명기되어 있다.
// @WebServlet어노테이션보다 web.wml에서 지정한 매핑코드의 우선순위가 훨씬 높다
// 서블릿 파일이되면 HttpServlet클래스를 자동으로 상속 받는다.

//@WebServlet("/Hworld")
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */


	
	// 생성자
    public HelloWorld() {
        
    }

	
    // 여기서 2가지 메서드가 나오는데 doGet(), doPost()d인데 ,이것은 이 서블릿 파일이 처리하는 부분이다.
    // 이 서블릿을 호출할때 클라이언트에서 여청이 들어올 때, get방식이냐, post방식이냐에 따라 호출이 달라진다.
    // doGet() 메서드는 그냥 출력하는 형태로 많이 쓰인다.
    // doPost() 메서드는 데이터를 가공이나 처리코드를 실행 할때 많이 사용된다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hellow Wolrd!");
		System.out.println("doGet()");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hellow Wolrd!");
		System.out.println("doPost()");
	}
	
	
	// 결론
	// 1. jsp파일 : HTML 파일내에 jsp 코드를 넣는것
	// servlet파일 : 자바파일이고, 반드시 매핑을 한 후 사용해야한다
}
