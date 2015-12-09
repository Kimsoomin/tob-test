package admin;

import java.util.List;

public interface AdminDAO {
	public int insert(AdminVO vo);
	public AdminVO login(String id, String password);
	public List<AdminVO> selectAll();
	public int update(AdminVO vo);
	public int delete(String id);
	public AdminVO selectOneBy(String id);
	String selectTotal(String day);
	
}
