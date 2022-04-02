package sec03_exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class initParamFilter implements Filter{
	
	private FilterConfig filterconfig = null;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		System.out.println("Filter02 초기화.....");
		this.filterconfig = filterConfig;
		
	}
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("Filter02 수행.....");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// web.xml에서 <initParam>태그로 설정된 값을 받아오는 코드
		String param1 = filterconfig.getInitParameter("param1");
		String param2 = filterconfig.getInitParameter("param2");
	
		String message;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(id.equals(param1) && pw.equals(param2)) {
			message = "로그인 성공";
		}
		else {
			message = "로그인 실패";
			
		}
		
		out.println(message);
		chain.doFilter(request, response);
		
		System.out.println("Filter02 완료....");
		
	}
	
	
	@Override
	public void destroy() {
		System.out.println("Filter02 해제....");
	}
	
}
