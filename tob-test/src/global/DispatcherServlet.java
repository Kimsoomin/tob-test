package global;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet{
	
	public static void exam(HttpServletRequest request, HttpServletResponse response, Command command)
			throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher(command.getView());
		dis.forward(request, response);
		System.out.println(" DispatcherServlet에서 커멘드 분리 후 전송완료!!");
	}
	
}
