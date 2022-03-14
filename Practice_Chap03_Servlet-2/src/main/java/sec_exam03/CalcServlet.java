package sec_exam03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcServlet
 */
@WebServlet("/Calc")
public class CalcServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	private static float USD_RATE = 1210.75F;  //달라
	private static float JPY_RATE = 10.113F;   //엔화
	private static float CNY_RATE = 160.31F;   //위안
	private static float GBP_RATE = 1475.75F;  //파운드
	private static float EUR_RATE = 1295.75F;  //유로
	
	
    public CalcServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		
		//클라이언트가 입력하는 값들을 받아오는 코드
		String command = request.getParameter("command");
		String won = request.getParameter("won");
		String operator = request.getParameter("operator");
		
		if(command != null && command.equals("calculate")) {
			String result = calculate(Float.parseFloat(won), operator);
			writer.print("<html><font size=10>변환 결과</font><br/>");
			writer.print("<font size=10>" + result + "</font><br/>");
			writer.print("<a href='Calc'>환율 계산기</a>");
			return;		
		}
		
		writer.print("<html><title>환율 계산기</title>");
		writer.print("<font size=5>환율 계산기</font><br/>");
		writer.print("<form name='frmCalc' method='get' action='Calc'>");
		writer.print("원화 : <input type='text' name='won' size=10 />");
		writer.print("<select name='operator'>");
		writer.print("<option value='dollar'>달러</option>");
		writer.print("<option value='en'>엔화</option>");
		writer.print("<option value='wian'>위안</option>");
		writer.print("<option value='pound'>파운드</option>");
		writer.print("<option value='euro'>유로</option>");
		writer.print("</select>");
		
		writer.print("<input type='hidden' name='command' value='calculate' />");
		writer.print("<input type='submit' value='변환' />");
		writer.print("</form></html>");
		writer.close();		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	//환율 계산하는 메서드
	private static String calculate(float won, String operator) {
		String result = null;
		
		if(operator.equals("dollar")) {
			result = String.format("%.6f", won / USD_RATE);
		}
		else if(operator.equals("en")) {
			result = String.format("%.6f", won / JPY_RATE);
		}
		else if(operator.equals("wian")) {
			result = String.format("%.6f", won / CNY_RATE);
		}
		else if(operator.equals("pound")) {
			result = String.format("%.6f", won / GBP_RATE);
		}
		else if(operator.equals("euro")) {
			result = String.format("%.6f", won / EUR_RATE);
		}
			
		return result;		
	}
}