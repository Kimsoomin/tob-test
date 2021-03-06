package global;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcTest {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
	try{
		Class.forName(Constants.ORACLE_DRIVER);
		conn = DriverManager.getConnection(
				Constants.ORACLE_URL,
				Constants.ORACLE_ID,
				Constants.ORACLE_PASSWORD);
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery("select * from event ");
		String id = null;
		while (rs.next()) {
			id = rs.getString("event_id");
		}
		System.out.println("ID : "+id);
	} catch(Exception e){
		System.out.println("Oracle DB 에러 발생");
		e.printStackTrace();
	}
	
	
			
	}
}
