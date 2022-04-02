package sec04_exam;

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
		writer.printf("클라이언트 주소 :%s %n", clientAddr);
		

		
		chain.doFilter(request, response);
		
		// 클라이언트 아이디
		String id = request.getParameter("id");
		writer.printf("클라이언트 아이디 :%s %n", id);
		
		String pw = request.getParameter("pw");
		writer.printf("클라이언트 아이디 :%s %n", pw);
		
		String contentType = response.getContentType();
		writer.printf("문서 유형 %s %n",contentType);
		writer.printf("===================================%n");
		
		
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
}
