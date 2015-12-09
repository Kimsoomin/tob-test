package global;

public class Command {
	
	private String action, view, page; 
	
 	public Command(String action, String page) {
		this.action = action;
		this.page = page;
		setView();
	}
	
	public String getAction() {
		return action;
	}
	public String getView() {
		return view;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public void setView() { //  -> /WEB-INF/view/action/page.jsp
		this.view = Constants.VIEW + this.action +"/" + this.page + ".jsp";
	}// VIEW = /WEB-INF/view/
}
