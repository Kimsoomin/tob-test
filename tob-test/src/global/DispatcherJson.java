package global;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.json.simple.JSONObject;

public class DispatcherJson extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public static void sendJSONObject(HttpServletResponse response, JSONObject obj)
			throws ServletException, IOException{
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
	}
	public static void sendGson(HttpServletResponse response, String json)
		throws ServletException, IOException{
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(json);
	}
}
