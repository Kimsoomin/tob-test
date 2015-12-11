package book;

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

public class BookDAOImpl implements BookDAO{

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	private static BookDAO instance = new BookDAOImpl();
	public static BookDAO  getInstance(){
		return instance;
		}
	
	
	private BookDAOImpl() {
		con = DatabaseFactory
				.getDatabase(Vendor.ORACLE, Constants.ORACLE_ID, Constants.ORACLE_PASSWORD)
				.getConnection();
	}
	
	@Override
	public int registration(BookVO o) {  //책등록
		int result = 0;
		try {
		String sql = "INSERT INTO BOOK (BOOK_ID,BOOK_NAME,PRICE,WRITER,GRADE,STOCK_SEQ,OPTION_BOOK,GENRE_ID) VALUES (?,?,?,?,?,?,?,?)";
			System.out.println("sql문은 무엇인가?"+sql);
			System.out.println("impl의 들어온 책 정보는? "+o.toString());
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o.getBookId());
			pstmt.setString(2, o.getBookName());
			pstmt.setString(3, o.getBookPrice());
			pstmt.setString(4, o.getWriter());
			pstmt.setString(5, o.getGrade());
			pstmt.setString(6, o.getStockSeq());
			pstmt.setString(7, o.getOptionBook());
			pstmt.setString(8, o.getGenreId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("bookDAOImpl의registration  :"+result);
		
		return result;
	}
	@Override// 전체 책 개수 조회
	public int amountBook() {
		int o = 0;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(DQL.count("book"));
			
			
			while (rs.next()) {
				o = rs.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return o;
	}


	@Override
	public int delete(String bookid) {
		int o = 0;
		String sql = "delete from book where book_id = ?";
		try {		 	
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, o); //여기에러날수있음
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return o;
	}
	@Override
	public BookVO searchByBook(String book) {
		BookVO temp = new BookVO();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from book where book_id = '"+book+"'");
			
			while (rs.next()) {

				temp.setBookId(rs.getString("book_Id"));
				temp.setBookName(rs.getString("book_Name"));
				temp.setBookPrice(rs.getString("Price"));
				temp.setWriter(rs.getString("writer"));
				temp.setGrade(rs.getString("grade"));
				temp.setStockSeq(rs.getString("stock_Seq"));
				temp.setOptionBook(rs.getString("option_Book"));
				temp.setGenreId(rs.getString("genre_Id"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAOImpl(책찾기 [책]이름.) :"+temp.getBookName());
		return temp;
	}


	@Override
	public List<BookVO> selectAll() {
		List<BookVO> list = new ArrayList<BookVO>();
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(DQL.searchAll("book"));	
			
			while (rs.next()) {
				BookVO temp = new BookVO();
				temp.setBookId(rs.getString("book_Id"));
				temp.setBookName(rs.getString("book_Name"));
				temp.setBookPrice(rs.getString("price"));
				temp.setWriter(rs.getString("writer"));
				temp.setGrade(rs.getString("grade"));
				temp.setStockSeq(rs.getString("stock_Seq"));
				temp.setOptionBook(rs.getString("option_Book"));
				temp.setGenreId(rs.getString("genre_Id"));
				
				list.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int update(BookVO o) { //책 정보 수정
		int result = 0;
		try {
			String sql = "UPDATE BOOK SET BOOK_NAME = ?, PRICE = ?"
					+ "where BOOK_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, o.getBookName());
			pstmt.setString(2, o.getBookPrice());
			pstmt.setString(3, o.getBookId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAOImpl : DB 수정 후 결과 리턴값 :"+result);
		return result;
	}
	
}
