package global;

import java.util.List;

public abstract class DAO {
	public int insert(Object o){return 0;}
	public int update(Object o){return 0;}
	public List selectAll(){return null;}
	public List selectBy(){return null;}
	public Object selectOneBy(String key){return null;}
	public int delete(Object o){return 0;};
	public int delete(String s){return 0;}; // 오버로딩
	public int delete(int o){return 0;};
	public int delete(String s1,String s2){return 0;};
	public abstract int count();
}
