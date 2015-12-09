package event;

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


/**
 * Servlet implementation class EventController
 */
@WebServlet("/event/Event.do")
public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventService service = EventServiceImpl.getInstance();
	String evtName,fromDt,toDt,evtId;
	JSONObject obj = new JSONObject();
	EventVO event = new EventVO();
	int result;
	@SuppressWarnings("unchecked")
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String path = request.getServletPath();
		System.out.println("패스 : " +path);
		Command command = Seperator.init(request, response);
		System.out.println("Event컨트롤러 page : "+command.getPage());
		switch (command.getPage()) {
		case "Event":
			break;
		case "join_event1":
		evtName = request.getParameter("evtName");
			System.out.println("입력된 이벤트이름:"+evtName);
			fromDt = request.getParameter("fromDt");
			System.out.println("이벤트 시작기간"+fromDt);
			toDt = request.getParameter("toDt");
			System.out.println("이벤트 끝기간"+toDt);

			
			event.setEvtName(evtName);
			System.out.println(event.getEvtName()+"vo에 저장된 이벤트이름");
			event.setFromDt(fromDt);
			System.out.println(event.getFromDt()+"vo 에 저장된 시작일");
			event.setToDt(toDt);
			System.out.println(event.getToDt()+"vo 에 저장된 종료일");
			
			result = service.join(event);
			
			if (result == 1) {
				System.out.println("이벤트 등록 성공");
				obj.put("result", "success");
				DispatcherJson.sendJSONObject(response, obj);
			} else {
				System.out.println("이벤트 등록 실패");
				obj.put("result", "fail");
				DispatcherJson.sendJSONObject(response, obj);
			}
			break;
		case "event_form":
			break;
		case "event_remove":
				
			break;
		case "event_update":
				
			break;
		default:
			break;
		}
		DispatcherServlet.exam(request, response, command);
	}
}
