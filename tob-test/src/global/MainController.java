package global;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;


/**
 * Servlet implementation class JsController
 */
@WebServlet({"/main/Home.do"})
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String path = request.getServletPath();
		System.out.println("패스 : " +path);
		Command command = Seperator.init(request, response);
		System.out.println("메인컨트롤러 page : "+command.getPage());
		switch (command.getPage()) {
		case "Home":
			break;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}
}