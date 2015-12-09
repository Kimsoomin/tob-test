package event;

import java.util.List;

public interface EventDAO {
	public List<EventVO> selectAll();
	public int insert(EventVO o);
	public int update(EventVO o);
	public int count();
	public int delete(String evtName);

}
