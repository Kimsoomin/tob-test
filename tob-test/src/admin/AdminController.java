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

import book.BookService;
import book.BookServiceImpl;
import book.BookVO;
import global.Command;
import global.DispatcherServlet;
import global.Seperator;
import member.MemberService;
import member.MemberServiceImpl;
import member.MemberVO;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin/Admin.do")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminService service = AdminServiceImpl.getInstance();
	MemberService memberService = MemberServiceImpl.getInstance();
	BookService bookService = BookServiceImpl.getInstance();
	Gson gson = new Gson();
	JSONObject json = new JSONObject();
	
	MemberVO member;
	BookVO book;
	List memberlist = new ArrayList();
	List booklist = new ArrayList();
	JSONObject obj = new JSONObject();
	
	String userid, password, email, addr, phone, bookId, bookName, bookPrice, writer;
	int result;
	
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		Command command = Seperator.init(request, response);
		System.out.println("어드민컨트롤러 page : "+command.getPage());
		switch (command.getPage()) {
		case "Admin":
			System.out.println("이제시작인가");
			break;
		case "header": break;
		case "member_list": 
			System.out.println("case: 회원목록 진입");
			memberlist = memberService.getList();
			JsonElement element = gson.toJsonTree(memberlist, new TypeToken<List>() {}.getType());
			JsonArray memberList = element.getAsJsonArray();
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(memberList);
			return;
		case "book_list":
			System.out.println("case: 북 목록 진입");
			booklist = bookService.getList();
			JsonElement element2 = gson.toJsonTree(booklist, new TypeToken<List>() {}.getType());
			JsonArray bookList = element2.getAsJsonArray();
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(bookList);
			return;
			
		case "member_profile":
			System.out.println("개인 프로필 진입");
			userid = request.getParameter("userid");
			System.out.println("가져온 아이디 "  + userid);
			member = memberService.searchById(userid);
			request.setAttribute("member", member);
			break;
			
		case "book_profile":
			System.out.println("북 프로필 진입");
			bookId = request.getParameter("bookId");
			System.out.println("가져온 책 아이디 "  + bookId);
			book = bookService.serachByBook(bookId);
			request.setAttribute("book", book);
			break;
		case "insert":
			System.out.println("인서트 진입");
			userid = request.getParameter("id");
			password = request.getParameter("password");
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			addr = request.getParameter("addr");
			System.out.println("아이디 " +userid);
			System.out.println("비번 " +password);
			System.out.println("이메일" +email);
			System.out.println("폰 " +phone);
			System.out.println("주소 " +addr);
			member = memberService.searchById(userid);
			member.setPassword(password);
			member.setEmail(email);
			member.setPhone(phone);
			member.setAddr(addr);
			result = memberService.change(member);
			json.put("result", userid + " 님의 정보수정을 완료했습니다.");
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(json);
			json.clear();
			return;
		case "insert2":
			System.out.println("인서트 진입");
			
			bookId = request.getParameter("bookid");
			System.out.println("책 아이디: " +bookId);
			
			bookName = request.getParameter("name");
			System.out.println("책 이름: " +bookName);
			
			bookPrice = request.getParameter("price");
			System.out.println("책 가격" + bookPrice);
			
			book = bookService.serachByBook(bookId);

			book.setBookName(bookName);
			book.setBookPrice(bookPrice);
			
			System.out.println(book.getBookId());
			System.out.println(book.getBookName());
			System.out.println(book.getBookPrice());
			result = bookService.change(book);
			json.put("result", bookId + " 정보수정을 완료했습니다.");
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(json);
			json.clear();
			return;
		case "delete":
			userid = request.getParameter("id");
			System.out.println("삭제 아이디:" +userid);
			memberService.remove(userid);
			json.put("result", userid + " 님의 탈퇴를 완료했습니다. ");
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(json);
			json.clear();
			return;	
			
		case "delete2":
			bookId = request.getParameter("bookid");
			bookService.delete(bookId);
			json.put("result", userid + " 삭제를 완료했습니다. ");
			response.setContentType("application/x-json; charset=utf-8");
			response.getWriter().print(json);
			json.clear();
			return;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}

}
