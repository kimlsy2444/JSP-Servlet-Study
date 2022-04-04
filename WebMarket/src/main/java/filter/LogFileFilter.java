package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter{
	
	
	PrintWriter writer = null;
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LogFileFilter초기화....");
		String filename = filterConfig.getInitParameter("filename");
		
		// 파일이 없는 경우
		if (filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		}
		// 매개변수로 받는 값이 FileWriter보조스트림을 연결하는데 true값은 파일을 덮어 쓰지말고
		// 이어서 계속 로그 기록을 남기기 위한 속성을 정의 한 것이다.
		// PrintWriter주스트림의 매개변수 중 true은 autoflush 를 하라는 뜻이다.
		try {
			writer = new PrintWriter(new FileWriter(filename,true), true);
		} catch (Exception e) {e.printStackTrace();}
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		writer.printf("접속 일시 : %s %n",this.getCurrentTime());
		// 요청한 클라이언트의 IP를 얻어오고 있다.
		String clientAddr = request.getRemoteAddr();
		writer.println("접속한 클라이언트 IP : " +  clientAddr);
		writer.println("접근한 URL 경로 " + this.getURLPath(request));
		long start = System.currentTimeMillis();
		writer.println("요청 처리 시작 시각 " + this.getCurrentTime());
		chain.doFilter(request, response);
		long end =  System.currentTimeMillis();
		writer.println("요청 처리 종료 시각 " + this.getCurrentTime());
		writer.println("요청 처리 소요 시간 " + (end -start) + "ms");
		writer.println("=================================================");
		
	}
	
	@Override
	public void destroy() {
		System.out.println("LogFileFilter해제....");
		writer.close(); // 리소스 해체
	}
	public String getCurrentTime() {
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy/MM/dd/a HH:mm:ss");
		return sformat.format(new Date());
		
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
}
