package book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import global.Command;
import global.DispatcherJson;
import global.DispatcherServlet;
import global.ParamMap;
import global.Seperator;

@WebServlet("/book/Book.do")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookService service = BookServiceImpl.getInstance();
	String bookid,bookname,bookprice,writer,grade,
	bookstock,genre;
	StringBuffer option;
	
	
	BookVO book = new BookVO();
	JSONObject obj = new JSONObject();
	Gson gson = new Gson();
	
       @SuppressWarnings("unchecked")
	public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		String path = request.getServletPath();
		Command command = Seperator.init(request, response);
		HttpSession session = request.getSession();
		
	switch (command.getPage()) {
	case "book":
		System.out.println("book  들어옴");break;
	case "book_join" : break;
	
	case "book_info": 
		bookid = request.getParameter("bookid");
		bookname = request.getParameter("bookname");
		bookprice = request.getParameter("bookprice");
		writer = request.getParameter("writer");
		grade = request.getParameter("grade");
		
		
		bookstock = request.getParameter("bookstock");
		
		option = ParamMap.getValuesBy(request, "option");
		
		genre = request.getParameter("genre");
		
		
		System.out.println("책번호 ="+bookid);
		System.out.println("책이름 ="+bookname);
		System.out.println("책가격 ="+bookprice);
		System.out.println("책저자 ="+writer);
		System.out.println("책등급 ="+grade);
		System.out.println("책재고 ="+bookstock);
		System.out.println("책옵션 ="+option);
		System.out.println("책장르 ="+genre);
		
		book.setBookId(bookid);
		book.setBookName(bookname);
		book.setBookPrice(bookprice);
		book.setWriter(writer);
		book.setGrade(grade);
		book.setStockSeq(bookstock);
		book.setOptionBook(option.toString());
		book.setGenreId(genre);
		System.out.println(book.getBookId());
		
		int result = service.registration(book);
		if (result == 1) {
			JSONObject obj = new JSONObject();
			System.out.println("책등록 완료");
			obj.put("result", "success");
			obj.put("bookname", book.getBookName());
			System.out.println("북네임은?"+book.getBookName());
			System.out.println("obj?"+obj);
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(obj);
		}else {
			System.out.println("책등록 실패");
			obj.put("result", "fail");
			DispatcherJson.sendJSONObject(response, obj);
		}
		return;
		
	case "remove":
		System.out.println("삭제페이지로 넘어옴");
		bookid = request.getParameter("bookid");
		result = service.delete(bookid);
		if (result == 1) {
			obj.put("result", "success");
			obj.put("bookid", book.getBookId());
			System.out.println("obj 실행 완료"+book.getBookId());
			DispatcherJson.sendJSONObject(response, obj);
			
		}else{
			obj.put("result", "fail");
			DispatcherJson.sendJSONObject(response, obj);
		}
		return;
	
	case "detail" : 
		bookid = request.getParameter("bookid");
		book = service.serachByBook(bookid);
		String json = gson.toJson(book);
		DispatcherJson.sendGson(response, json);
		return;
		
		
	case "mypage" : 
		bookid = request.getParameter("bookid");
		System.out.println("로그인 진입 my page :"+bookid);
		book = service.serachByBook(bookid);
		request.setAttribute("member", book);
		break;
		
		
	case "update":
		
		bookprice = request.getParameter("bookprice");
		bookstock = request.getParameter("bookstock");
		System.out.println("변경된 가격"+bookprice);
		System.out.println("변경된 재고"+bookstock);
		
		book.setBookPrice(bookprice);
		book.setStockSeq(bookstock);
		int result1 = service.change(book);
		if (result1 ==1) {
			System.out.println("변경성공");
			String changebook = gson.toJson(book);
			DispatcherJson.sendGson(response, changebook);
			
		}else {
			System.out.println("변경실패");
		}
			return; //ajax 는 리턴
			
	default:break;
	}
	
	DispatcherServlet.exam(request, response, command);
	}
}
