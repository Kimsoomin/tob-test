package event;

import java.io.Serializable;

public class EventVO  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String evtId;
	private String evtName;
	private String fromDt;
	private String toDt;

	
	public static EventVO instance = new EventVO();
	public static EventVO getInstance(){
		return instance;
	}
	public EventVO() {
		// TODO Auto-generated constructor stub
	}
	public EventVO(String evtId,String evtName,String fromDt,String toDt) {
		this.evtId = evtId;
		this.evtName = evtName;
		this.fromDt = fromDt;
		this.toDt = toDt;
	}
	public String getEvtId() {
		return evtId;
	}
	public String getEvtName() {
		return evtName;
	}
	public String getFromDt() {
		return fromDt;
	}
	public String getToDt() {
		return toDt;
	}
	public void setEvtId(String evtId) {
		this.evtId = evtId;
	}
	public void setEvtName(String evtName) {
		this.evtName = evtName;
	}
	public void setFromDt(String fromDt) {
		this.fromDt = fromDt;
	}
	public void setToDt(String toDt) {
		this.toDt = toDt;
	}
	@Override
	public String toString() {
		return "이벤트 [당첨자 아이디=" + evtId + ", 이벤트명=" + evtName + ", 첫기간=" + fromDt + ", 끝기간=" + toDt + "]";
	}
	
	
}
