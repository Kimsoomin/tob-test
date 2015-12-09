package admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import book.BookVO;
import global.Command;
import global.DispatcherServlet;
import global.Seperator;
import member.MemberVO;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin/Admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminService service = AdminServiceImpl.getInstance();
	Gson gson = new Gson();
	MemberVO member = new MemberVO();
	BookVO book = new BookVO();
	List list = new ArrayList();
	JSONObject obj = new JSONObject();
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		Command command = Seperator.init(request, response);
		System.out.println("어드민컨트롤러 page : "+command.getPage());
		switch (command.getPage()) {
		case "Admin":
			System.out.println("이제시작인가");
			break;
		case "member_list": 
			System.out.println("case: 회원목록 진입");
			Gson gson = new Gson();
			list = service.getMemberList();
			JsonElement element = gson.toJsonTree(list, new TypeToken<List>() {}.getType());
			JsonArray memberList = element.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(memberList);
			System.out.println("case: 빠져나가!");
			return;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}

}
