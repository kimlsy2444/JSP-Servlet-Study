package filter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("WebMarket 초기화....");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("접속한 클라이이언트 IP" + request.getRemoteAddr());
		// 웹페이지의 성능 테스트를 하기 위해 밀리초로 계산해서 표식을 해보도록 한다.
		long start =  System.currentTimeMillis(); // 0.001초
		
		System.out.println("접근한 URL 경로 : " +this.getURLPath(request));
		System.out.println("요청 처리 시작 시각  : " +this.getCurrentTime());
		
		chain.doFilter(request, response);
		long end =  System.currentTimeMillis(); // 0.001초
		System.out.println("요청 처리 종료 시각 : " +this.getCurrentTime());
		System.out.println("요청 처리 소요 시각 : " +(end - start) + "ms");
		System.out.println("--------------------------------------------------------------\n");
	}
	
	@Override
	public void destroy() {
		System.out.println("WebMarket 필터해제....");
	}
	
	public String getURLPath(ServletRequest request) {
		HttpServletRequest hRequest = null; 
		String currentPath = "";
		String queryString = "";
		
		if(request instanceof HttpServletRequest) {
			hRequest  = (HttpServletRequest)request; // 다운 캐스팅
			currentPath = hRequest.getRequestURI(); // URI 가져오기
			// 아래 코드는 get,post 이냐 따라서 달라질 것이다. // get 방식
			queryString = (queryString == null) ? "" : "?"  + hRequest.getQueryString();
		}
		
		return currentPath + queryString;
	}
	
	
	public String getCurrentTime() {
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy/MM/dd/a HH:mm:ss");
		return sformat.format(new Date());
	}
}
