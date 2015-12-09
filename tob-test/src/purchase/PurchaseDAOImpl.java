package purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import global.Constants;
import global.DatabaseFactory;
import global.Vendor;


public class PurchaseDAOImpl implements PurchaseDAO{

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private PurchaseVO purchase = new PurchaseVO();

	private static PurchaseDAO instance = new PurchaseDAOImpl();
	public static PurchaseDAO getInstance(){
		return instance;
	};
	
	public PurchaseDAOImpl() {
		con = DatabaseFactory.getDatabase(Vendor.ORACLE, Constants.ORACLE_ID, Constants.ORACLE_PASSWORD).getConnection();
	}
	
	
	@Override
	public int insert(PurchaseVO o) {
		int result = 0;
		
		try {
			String sql ="insert into purchase_list(pur_num,sum,account_num,userid)"
					+ " values(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o.getAccountNum());
			// 다른 테이블에서 값을 받아오는 것 처리.
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	@Override
	public int delete(String purNum) {
		int result = 0;
		String sql = "delete from purchase_list where pur_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, purNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("pur_num 삭제 성공");
		return result;
	}

	@Override
	public PurchaseVO selectBypurNum(String purNum) {
		PurchaseVO temp = new PurchaseVO();
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from purchase_list where pur_num = '"+purNum+"'");
			
			while (rs.next()) {
				
				temp.setPurNum(rs.getString("purNum"));
				//temp.setSum(rs.getShort("sum"));
				temp.setAccountNum(rs.getString("accountNum"));
				temp.setUserid(rs.getString("userid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("purNum으로 검색(입력받은 purNum) : "+temp.getPurNum());
		
		return temp;
	}

	@Override
	public List<PurchaseVO> selectByAccNum(String accountNum) {
		List<PurchaseVO> list = new ArrayList<PurchaseVO>();
		try {
			String sql = "select * from purchase_list where account_num = '"+accountNum+"'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				PurchaseVO temp = new PurchaseVO();
				temp.setPurNum(rs.getString("purNum"));
				temp.setSum(rs.getShort("sum"));
				temp.setAccountNum(rs.getString("accountNum"));
				temp.setUserid(rs.getString("userid"));
				list.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<PurchaseVO> selectAll() {
		List<PurchaseVO> list = new ArrayList<PurchaseVO>();
		String sql = "select * from purchase_list";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				PurchaseVO temp = new PurchaseVO();
				temp.setPurNum(rs.getString("purNum"));
				temp.setSum(rs.getShort("sum"));
				temp.setAccountNum(rs.getString("accountNum"));
				temp.setUserid(rs.getString("userid"));
				list.add(temp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
