package global;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Seperator {
	static CommandFactory factory = new CommandFactory();
	public static Command command;
	public static Command init(HttpServletRequest request, HttpServletResponse response) 
	{
		String path = request.getServletPath(); // /admin/Admin.do
		System.out.println("Seperator 진입, 경로 : " +path);
		String directory = path.split("/")[1];   // admin
		String action = path.split("/")[2]; //Admin.do
		String temp = action.substring(0, action.indexOf(".")); //Admin
		String page = request.getParameter("page");
		if (page == null) {
			page = temp;
		}
		
		System.out.println("분리된 directory : " + directory);
		System.out.println("분리된 page : " + page);
		if (directory.equals("main")) {
			directory = "global";
		}
		
		return factory.createCommand(directory, page);
	}
}
