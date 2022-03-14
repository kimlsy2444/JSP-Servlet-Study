package sec05_exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DogchiceServlet
 */
@WebServlet("/choiceDog")
public class DogcohiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DogcohiceServlet() {
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		String[] dog = request.getParameterValues("dog");
		
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("</head>");
		
		writer.println("<body bgcolor='green'>");
		writer.println("<table align = 'center' bgcolor ='yellow'>");
		writer.print("<tr>");
		
		for(int i = 0; i<dog.length; i++) {
			writer.println("<td>");
			writer.println("<img src = '"+dog[i]+"'>");
			writer.println("</td>");
		}

		writer.print("</tr>");
		writer.print("</table>");
		
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}

}
