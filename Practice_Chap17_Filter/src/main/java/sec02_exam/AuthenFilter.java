package sec02_exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter{
	
	public AuthenFilter() {
		System.out.println("AuthenFilter 생성자 호출");
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println(" AuthenFilter 초기화....");
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter01.jsp 초기화....");
		String name = request.getParameter("name");
		
		if(name == null || name.equals("")) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("입력된 name값은 null입니다.");
			return;
			
		}
		chain.doFilter(request, response);

		
	
	
	}
	@Override
	public void destroy() {
		System.out.println("Filter01 해제....");
	}
}
