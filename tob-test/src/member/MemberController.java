package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import global.Command;
import global.DispatcherJson;
import global.DispatcherServlet;
import global.Seperator;

/*
 * Servlet implementation class MemberController
 */

@WebServlet("/member/Member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("unchecked")
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{

		Command command = Seperator.init(request, response);		
		MemberService service = MemberServiceImpl.getInstance();		
		MemberVO member = new MemberVO();
		JSONObject obj = new JSONObject();
		
		String userid, password, name, birth, gender, email, phone, addr, mode;

		switch (command.getPage()) {
		// 회원가입
		case "join":
			break;
		case "join_act":
			userid = request.getParameter("userid");
			password = request.getParameter("password");
			name = request.getParameter("name");
			birth = request.getParameter("birth");
			gender = request.getParameter("gender");
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			addr = request.getParameter("addr");			
			
			member.setUserid(userid);
			member.setPassword(password);
			member.setName(name);
			member.setBirth(birth);
			member.setGender(gender);
			member.setEmail(email);
			member.setPhone(phone);			
			member.setAddr(addr);
			
			MemberVO memberChk = new MemberVO();
			memberChk = service.searchById(userid);
			
			if((userid).equals(memberChk.getUserid())) {
				obj.put("result", "chk");				
			} else {
				int result = service.join(member);
				
				if (result == 1) {
					obj.put("result", "success");
					obj.put("name", member.getName());
				} else {
					obj.put("result", "fail");
				}
			}			
			
			DispatcherJson.sendJSONObject(response, obj);
			return;
		case "join_chk":
			userid = request.getParameter("userid");			
			member = service.searchById(userid);
			if((userid).equals(member.getUserid())) {
				obj.put("result", "fail");				
			} else {
				obj.put("result", "success");
			}
			DispatcherJson.sendJSONObject(response, obj);
			return;
		// 마이페이지
		case "mypage":
			userid = request.getParameter("userid");
			member = service.searchById(userid);
			request.setAttribute("member", member);
			break;
		case "mypage_act":
			mode = request.getParameter("mode");
			userid = request.getParameter("userid");
			
			if(mode.equals("member")) {				
				email = request.getParameter("email");
				phone = request.getParameter("phone");
				addr = request.getParameter("addr");			
				
				member.setUserid(userid);;
				member.setEmail(email);
				member.setPhone(phone);			
				member.setAddr(addr);
				
				int result = service.change(member);
				
				if(result > 0) {
					obj.put("result", "success");				
				} else {
					obj.put("result", "fail");	
				}	
			} else {
				password = request.getParameter("password");
				
				member.setUserid(userid);;
				member.setPassword(password);
				
				int result = service.changePwd(member);
				
				if(result > 0) {
					obj.put("result", "success");				
				} else {
					obj.put("result", "fail");	
				}				
				
			}
			
			DispatcherJson.sendJSONObject(response, obj);
			return;
		// 아이디 비번찾기
		case "find":
			break;
		case "find_act":
			mode = request.getParameter("mode");
			if(mode.equals("id")) {
				name = request.getParameter("name");
				birth = request.getParameter("birth");			
				
				member = service.selectFindId(name, birth);
				
				if(!("").equals(member.getUserid()) && null != member.getUserid()) {
					obj.put("result", "success");
					obj.put("userid", member.getUserid());
				} else {
					obj.put("result", "fail");
				}
			} else {
				userid = request.getParameter("userid");
				email = request.getParameter("email");			
				
				member = service.selectFindPwd(userid, email);
				
				if(!("").equals(member.getPassword()) && null != member.getPassword()) {
					obj.put("result", "success");
					obj.put("password", member.getPassword());
				} else {
					obj.put("result", "fail");
				}				
			}
			
			DispatcherJson.sendJSONObject(response, obj);
			return;
		case "join_out":
			userid = request.getParameter("userid");
			int result = service.remove(userid);
			
			if(result > 0) {
				obj.put("result", "success");				
			} else {
				obj.put("result", "fail");
			}
			DispatcherJson.sendJSONObject(response, obj);
			return;
		default:
			break;
		}
		
		DispatcherServlet.exam(request, response, command);
	}

}
