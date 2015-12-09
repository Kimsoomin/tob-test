package event;

import java.util.List;



public interface EventService {
	public int join(EventVO o);
	public int change(EventVO o);
	public int remove(String evtName);
	public int count();
	public List<EventVO> getList();
}
