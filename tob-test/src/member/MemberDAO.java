package member;

import java.util.List;

public interface MemberDAO {
   public List<MemberVO> selectAll();
   public int insert(MemberVO o);
   public int update(MemberVO o);
   public List<MemberVO> selectSomeBy(String s1,String s2);
   public MemberVO selectOneBy(String userid);
   public int count();
   public int delete(String userid);
   public MemberVO login(String id, String pass);
   public MemberVO selectFindId(String s1,String s2);
   public MemberVO selectFindPwd(String s1,String s2);
   public int changePwd(MemberVO member);
   
}