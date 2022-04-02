package sec01_exam;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class LogginFilter implements Filter {


	
	// 필터가 생성될 떄 단한번만 호출이 된다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("필터 초기화 됨");
	}
	
	// 요청시마다 필터가 실행하는 메서드
	@Override
	public void doFilter(ServletRequest requset, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("요청이 필터에서 추가됨");
		chain.doFilter(requset, response);
		System.out.println("응답이 필터에서 추가됨");
		
	}

	// 필터가 제거 될 때 실행
	@Override
	public void destroy() {
		System.out.println("필터 제거됨");
	}
	


}
