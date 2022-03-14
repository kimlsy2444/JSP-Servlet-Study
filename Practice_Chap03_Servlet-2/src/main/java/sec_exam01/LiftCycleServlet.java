package sec_exam01;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LiftCycleServlet
 */
@WebServlet("/LC")
public class LiftCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	//생성자
    public LiftCycleServlet() {
        System.out.println("생성자 호출");
    }
    
    //init()는 ctrl+space바를 눌러 직접 입력하여 코딩하자
    //최초 한번만 실행이 된다.
    @Override
	public void init() throws ServletException {
		System.out.println("init()호출");
	}	
    
    //실행되었을때, 서블릿 객체가 메모리에 로딩이 되고, 계속 재사용을 한다.
    //주소표시줄에서 새로고침을 계속 하면 doGet()호출이 되는 것을 볼 수가 있다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()호출");
	}
	
	//doGet(),doPost()가 없다면 service()가 호출이 되고,
	//세가지 메서드가 다 존재하여도 service()가 호출이 된다.
	//service()는 get,post방식으로 어떤 메서드 방식으로 호출이 되었는지
	//알 길이 없다.하여, 통상적으로 doGet(),doPost()만 사용한다.
//	@Override
//	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
//		System.out.println("service()호출");
//	}	
	
	//서버를 중지시켜 보면 destroy()가 호출되는 것을 볼수가 있다.
	@Override
	public void destroy() {
		System.out.println("destroy()호출");
	}
	
	//오버라이딩의 개념이 아니다.직접 메서드를 만들어주는 것이다.(중요)
	//선처리 부분에 해당한다.
	//init()메서드가 호출되기 전에 먼저 실행한다.
	//@PostConstruct어노테이션이 컴파일러한테 따로 지시한다.
	private void initPostConstructor() {
		System.out.println("initPostConstructor() 선처리");
	}
	
	//오버라이딩의 개념이 아니다.직접 메서드를 만들어주는 것이다.(중요)
	//후처리 부분에 해당한다.
	//destroy()메서드가 호출된 후에 실행한다.
	//@PreDestroy어노테이션이 컴파일러한테 따로 지시한다.
	private void destroyPredestroy() {
		System.out.println("destroyPredestroy() 후처리");
	}
}
