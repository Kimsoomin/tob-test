package event;

import java.util.List;

public class EventServiceImpl implements EventService {
	private static EventService instance = new EventServiceImpl();
	public static EventService getInstance(){
		return instance;
	}
	EventDAO dao = EventDAOImpl.getInstance();
	@Override
	public int change(EventVO o) {
		return dao.update(o);
	}
	@Override
	public int remove(String evtName) {
		return dao.delete(evtName);
	}
	@Override
	public int count() {
		return dao.count();
	}
	@Override
	public List<EventVO> getList() {
		return dao.selectAll();
	}
	@Override
	public int join(EventVO o) {
		return dao.insert(o);
	}
}
