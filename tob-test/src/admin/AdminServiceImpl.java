package admin;

import java.util.List;

import member.MemberDAO;
import member.MemberDAOImpl;
import member.MemberService;
import member.MemberServiceImpl;
import member.MemberVO;

public class AdminServiceImpl implements AdminService{
	private static AdminService instance = new AdminServiceImpl();
	AdminService adminService = AdminServiceImpl.getInstance();
	public static AdminService getInstance(){
		return instance;
	}
	
	AdminDAO adminDAO = AdminDAOImpl.getInstance();
	MemberService memberService = MemberServiceImpl.getInstance();
	MemberDAO memberDAO = MemberDAOImpl.getInstance();
/*	BookService bookService = BookServiceImpl.getInstance();*/
	MemberVO memberVO = new MemberVO(); 
	

	@Override
	public int adminJoin(AdminVO vo) {
		return adminDAO.insert(vo);
	}

	@Override
	public AdminVO login(String id, String password) {
		return adminDAO.login(id, password);
	}

	@Override
	public List getAdminList() {
		return adminDAO.selectAll();
	}

	@Override
	public int adminChange(AdminVO vo) {
		return adminDAO.update(vo);
	}

	@Override
	public int adminRemove(String id) {
		return adminDAO.delete(id);
	}
	
	@Override
	public List getMemberList() {
		return memberService.getList();
	}

	@Override
	public List searchByMember(String domain, String searchword) {
		return memberService.searchBySearchword(domain, searchword);
	}

	@Override
	public int memberRemove(String userid) {
		return memberService.remove(userid);
	}

	@Override
	public int memberCount() {
		return memberService.count();
	}

//	@Override
//	public int bookReg(BookVO vo) {
//		return 0;
//		bookService.regstration();
//	}

	@Override
	public List getBookList() {
		return null;
//		bookService.getList();
	}

	@Override
	public List searchByBook(String domain, String searchwork) {
		return null;
//		bookService.searchByBook();
	}
	
//	@Override
//	public int change(BookVO vo) {
//		return 0;
//		bookService.change();
//	}

	@Override
	public int bookRemove(String userid) {
		return 0;
//		bookService.delete();
	}

	@Override
	public int getOrderToday(String today) {
		return 0;
	}

	@Override
	public int getOrderWeek(String week) {
		return 0;
	}

	@Override
	public int getConMember(String today) {
		return /*memberVO.getCon()*/ 1;
	}

	@Override
	public int MemberOrderToday(String today) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int MemberJoinToday(String today) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int MemberWithdraw(String today) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getTotal(String day) {
		return adminDAO.selectTotal(day);
	}

}
