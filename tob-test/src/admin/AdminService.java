package admin;

import java.util.List;

public interface AdminService {	
	
	// Admin CRUD
	// C : Admin 생성
	public int adminJoin(AdminVO vo);
	// 로그인
	public AdminVO login(String id, String password);
	// R : Admin 사내 확인
	public List getAdminList();
	// U : Admin 권한 업데이트
	public int adminChange(AdminVO vo);
	// D : Admin 삭제
	public int adminRemove(String id);

	// 멤버 CRUD
	// R : MemberService selectAll
	public List getMemberList();
	// R : MemberService selectOneBy
	public List searchByMember(String domain, String searchword);
	// R : MemberService count
	public int memberCount();
	// D : MemberService delete
	public int memberRemove(String userid);
	
	
	// 책
	// C : BookService registration
//	public int bookReg(BookVO vo);
	// R : BookService selectAll
	public List getBookList();
	// R : BookService searchByBook
	public List searchByBook(String domain, String searchwork);
	// U : 
//	public int change(BookVO vo);
	// D : BookService delete
	public int bookRemove(String userid);
	
	// 통계
	// R :
	public int getOrderToday(String today);	// 주문현황 Today
	public int getOrderWeek(String week);	// 일주일 주문현황
	public int getConMember(String today);	// 방문현황
	
	public int MemberOrderToday(String today);	// 회원현황 구매
	public int MemberJoinToday(String today);	// 회원현황 신규가입
	public int MemberWithdraw(String today);	// 회원현황 탈퇴
	public String getTotal(String string);

	
}
