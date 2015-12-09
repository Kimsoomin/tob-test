package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import global.Constants;
import global.DQL;
import global.DatabaseFactory;
import global.Vendor;
import member.MemberVO;

public class AdminDAOImpl implements AdminDAO{
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private List<AdminVO> list;
	private AdminVO adminVO = new AdminVO();
	
	private static AdminDAO instance = new AdminDAOImpl();
	public static AdminDAO getInstance(){
		return instance;
	}

	AdminService adminService = AdminServiceImpl.getInstance();
	
	public AdminDAOImpl() {
		con = DatabaseFactory
				.getDatabase(Vendor.ORACLE, Constants.ORACLE_ID, Constants.ORACLE_PASSWORD)
				.getConnection();
	}
	
	@Override
	public String selectTotal(String day) {
		System.out.println("다오 들어옴");
		String total = null;
		String sql = "select sum from purchase where account_num = '"+day+"'";
		System.out.println(sql);
		try {
			stmt = con.createStatement(); // 쿼리를 실행하는 객체
			rs = stmt.executeQuery(sql);
		     
			while (rs.next()) {
				adminVO.setTotal(rs.getString("sum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return adminVO.getTotal();
	}
	
	@Override
	public int insert(AdminVO vo) {
		int result = 0;
		try {
			String sql = "insert into admin ("
					+"id,password"
					+") values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAO: admin가입결과: "+result);
		return result;
	}
	

	@Override
	public AdminVO login(String id, String password) {
		adminVO = this.selectOneBy(id);
		if (adminVO.getId() == null) {
			return null;
		} 
		if (adminVO.getPassword().equals(password)) {
			return adminVO;
		}else{
			return null;
		}
	}
	
	
	@Override
	public List<AdminVO> selectAll() {
		list = new ArrayList<AdminVO>();
		try {
			stmt = con.createStatement(); // 쿼리를 실행하는 객체
			rs = stmt.executeQuery(DQL.searchAll("admin"));
		     
			while (rs.next()) {
				AdminVO temp = new AdminVO(); 
				temp.setId(rs.getString("id"));
				temp.setPassword(rs.getString("password"));
				list.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int update(AdminVO vo) {
		int result = 0;
		try {
			String sql = "update admin set password = ?"
					+"where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, adminVO.getPassword());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAO: 오라클 변경 후 리턴값: " +result);
		return result;
		
	}
	
	@Override
	public int delete(String id) {
		int result = 0;
		try {
			String sql = "delete from admin where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("삭제성공");
		return result;
	}

	@Override
	public AdminVO selectOneBy(String id) {
			AdminVO temp = new AdminVO();
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select * from member where id = '"+id+"'");
				
				while (rs.next()) {
					temp.setId(rs.getString("id"));
					temp.setPassword(rs.getString("password"));

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println("홍길동 명세DAO: " +temp.getId());
			return temp;
		}

	
}











